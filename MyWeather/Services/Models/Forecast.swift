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
    let day: Day
}

struct Day: Decodable {
    let maxtempC: Double
    let mintempC: Double
    let condition: Condition
}
