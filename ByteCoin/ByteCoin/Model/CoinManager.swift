//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateWeather(_ coinManager: CoinManager, coinModel: CoinModel)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "43C6617B-AA8F-428F-BFF8-0A3EB6282B06"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?
    
    func fetchRate(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    print("No data")
                    return
                }
                
                if let safeData = data {
                    if let coinModel = self.parseJSON(safeData) {
                        delegate?.didUpdateWeather(self, coinModel: coinModel)
                    }
                }
                
            }
            
            task.resume()
        }
    }
    
    func parseJSON(_ coindData: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coindData)
            let rate = decodedData.rate
            let rateString = String(format: "%.2f", rate)
            let fiat = decodedData.asset_id_quote
            let coinModel = CoinModel(currencyRate: rateString, fiatName: fiat)
            return coinModel
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
    
    
}
