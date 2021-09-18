//
//  NetworkDataFetcher.swift
//  MyWeather
//
//  Created by Nikita on 18.09.21.
//

import Foundation

protocol DataFetcher {
    func fetchJSONData<T: Decodable>(urlString: String, response: @escaping (T?) -> Void)
}

class NetworkDataFetcher: DataFetcher {
    
    var networking: Networking
    
    init(networking: Networking = NetworkService()) {
        self.networking = networking
    }
    
    func fetchJSONData<T: Decodable>(urlString: String, response: @escaping (T?) -> Void) {
        networking.request(urlString: urlString) { data, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "")
                return
            }
            
            let decoded = self.decodeJSON(type: T.self, data: data)
            response(decoded)
        }
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, data: Data?) -> T? {
        guard let data = data else { return nil }
        let decoder = JSONDecoder()
        do {
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let object = try decoder.decode(type.self, from: data)
            return object
        } catch let error {
            print(error)
            return nil
        }
    }
}
