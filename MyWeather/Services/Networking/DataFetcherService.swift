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
    
    func fetchWeather(latitude: Double, longitude: Double, completion: @escaping (Weather?) -> Void) {
        let url = "https://api.openweathermap.org/data/2.5/onecall?lat=\(latitude)&lon=\(longitude)&exclude=7&appid=738818b059896f464e5ab466d03815cb"
        networkDataFetcher.fetchJSONData(urlString: url, response: completion)
    }
}
