//
//  Current.swift
//  MyWeather
//
//  Created by Nikita on 18.09.21.
//

struct Current: Decodable {
    let lastUpdatedEpoch: Int
    let lastUpdated: String
    let tempC: Double
    let isDay: Int
    let condition: Condition
    let feelslikeC: Double
    let visKm: Double
}
