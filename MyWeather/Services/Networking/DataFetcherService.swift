//
//  DataFetcherService.swift
//  MyWeather
//
//  Created by Nikita on 18.09.21.
//

import Foundation

class DataFetcherService {
    
    var networkDataFetcher: DataFetcher
    
    init(networkDataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.networkDataFetcher = networkDataFetcher
    }
    
    func fetchWeather(cityName: String, completion: @escaping (Weather?) -> Void) {
        let url = "https://api.weatherapi.com/v1/forecast.json?key=6dbb04651d5d47ceab8134427210909&q=\(cityName)&days=3&aqi=no&alerts=no"
        networkDataFetcher.fetchJSONData(urlString: url, response: completion)
    }
    
    func fetchWeather(latitude: Double, longitude: Double, completion: @escaping (Weather?) -> Void) {
        let url = "https://api.weatherapi.com/v1/forecast.json?key=6dbb04651d5d47ceab8134427210909&q=\(latitude),\(longitude)&days=3&aqi=no&alerts=no"
        networkDataFetcher.fetchJSONData(urlString: url, response: completion)
    }
}
