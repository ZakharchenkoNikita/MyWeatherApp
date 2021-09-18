//
//  Location.swift
//  MyWeather
//
//  Created by Nikita on 18.09.21.
//

struct Location: Decodable {
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
    let tzId: String
    let localtimeEpoch: Int
    let localtime: String
}
