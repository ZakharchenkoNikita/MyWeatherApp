//
//  Forecast.swift
//  MyWeather
//
//  Created by Nikita on 18.09.21.
//

struct Forecast: Decodable {
    let forecastday: [Forecastday]
}

struct Forecastday: Decodable {
    let date: String
}
