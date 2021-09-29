//
//  Forecast.swift
//  MyWeather
//
//  Created by Nikita on 18.09.21.
//

import RealmSwift

class Forecast: Object, Decodable {
    var forecastday = List<Forecastday>()
}

class Forecastday: Object, Decodable {
    @objc dynamic var date = ""
    @objc dynamic var day: Day?
}

class Day: Object, Decodable {
    @objc dynamic var maxtempC = 0.0
    @objc dynamic var mintempC = 0.0
    @objc dynamic var condition: Condition?
}
