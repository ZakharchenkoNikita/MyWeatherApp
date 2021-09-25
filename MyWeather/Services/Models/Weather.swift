//
//  Weather.swift
//  MyWeather
//
//  Created by Nikita on 18.09.21.
//

import RealmSwift

class Weather: Object, Decodable {
    @objc dynamic var location: Location?
    @objc dynamic var current: Current?
//    let forecast = List<Forecast>()
}
