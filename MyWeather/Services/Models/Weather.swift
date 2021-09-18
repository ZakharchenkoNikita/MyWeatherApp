//
//  Weather.swift
//  MyWeather
//
//  Created by Nikita on 18.09.21.
//

struct Weather: Decodable {
    let location: Location
    let current: Current
    let forecast: Forecast
}
