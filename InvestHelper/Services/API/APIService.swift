import Foundation

enum Metric {
    case usdRub, keyRate, brent, imoex
}

class APIService {
    static let shared = APIService() //Singlton for testing, afther delete
    private init() {}
    
    // MARK: - Public API
    func fetchMetrics(_ metrics: [Metric]) async -> [Metric: Double] {
        var result: [Metric: Double] = [:]
        
        await withTaskGroup(of: (Metric, Double?).self) { group in
            for metric in metrics {
                group.addTask {
                    switch metric {
                    case .usdRub: return (.usdRub, await self.fetchUSDRUB())
                    case .keyRate: return (.keyRate, await self.fetchKeyRate())
                    case .brent: return (.brent, await self.fetchBrent())
                    case .imoex: return (.imoex, await self.fetchIMOEX())
                    }
                }
            }
            
            for await (metric, value) in group {
                if let value = value { result[metric] = value }
            }
        }
        
        return result
    }
    
    // MARK: - Private helpers (async)
    private func fetchUSDRUB() async -> Double? {
        guard let url = URL(string: "https://www.cbr.ru/scripts/XML_daily.asp") else { return nil }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let parser = XMLParser(data: data)
            let delegate = CBRXMLParserDelegate()
            parser.delegate = delegate
            parser.parse()
            return delegate.rates["USD"]
        } catch { return nil }
    }
    
    func fetchBrent() async -> Double? {
        
        let apiKey = "50c676a373968062739f0b70c49b74be550a2d7bfa38daadd6177e16b3eb4d2b"
        
        guard let url = URL(string: "https://api.oilpriceapi.com/v1/prices/latest?by_code=BRENT_CRUDE_USD") else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Token \(apiKey)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
               let dataObj = json["data"] as? [String: Any],
               let price = dataObj["price"] as? Double {
                
                return price
            }
            
            return nil
            
        } catch {
            print("Ошибка загрузки нефти:", error)
            return nil
        }
    }
    
    private func fetchIMOEX() async -> Double? {
        let urlString = "https://iss.moex.com/iss/engines/stock/markets/index/boards/SNDX/securities/IMOEX2.json"
        guard let url = URL(string: urlString) else { return nil }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard
                let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                let marketdata = json["marketdata"] as? [String: Any],
                let dataArray = marketdata["data"] as? [[Any]],
                let firstRow = dataArray.first
            else { return nil }
            
            if let lastValueIndex = (marketdata["columns"] as? [String])?.firstIndex(of: "CURRENTVALUE"),
               firstRow.count > lastValueIndex {
                if let value = firstRow[lastValueIndex] as? Double {
                    return value
                } else if let strValue = firstRow[lastValueIndex] as? String, let value = Double(strValue) {
                    return value
                }
            }
            
            return nil
        } catch {
            print("Ошибка загрузки IMOEX:", error)
            return nil
        }
    }
}

// MARK: - XML Parser Delegates

class CBRXMLParserDelegate: NSObject, XMLParserDelegate {
    var rates = [String: Double]()
    private var currentElement = ""
    private var currentChar = ""
    private var currentValute = ""
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        if elementName == "Valute" { currentValute = attributeDict["ID"] ?? "" }
        currentChar = ""
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) { currentChar += string }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "Value", currentValute == "R01235" {
            rates["USD"] = Double(currentChar.replacingOccurrences(of: ",", with: "."))
        }
    }
}

class CBRKeyRateXMLParser: NSObject, XMLParserDelegate {
    var latestRate: Double?
    private var currentElement = ""
    private var currentChar = ""
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        currentChar = ""
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) { currentChar += string }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "Value" { latestRate = Double(currentChar.replacingOccurrences(of: ",", with: ".")) }
    }
}
