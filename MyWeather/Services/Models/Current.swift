//
//  Current.swift
//  MyWeather
//
//  Created by Nikita on 18.09.21.
//

import RealmSwift

class Current: Object, Decodable {
    @objc dynamic var dt = 0
    @objc dynamic var sunrise = 0
    @objc dynamic var sunset = 0
    @objc dynamic var temp = 0.0
    @objc dynamic var feelsLike = 0.0
    @objc dynamic var pressure = 0
    @objc dynamic var humidity = 0
    @objc dynamic var dewPoint = 0.0
    @objc dynamic var clouds = 0
    @objc dynamic var visibility = 0
    @objc dynamic var windSpeed = 0.0
    @objc dynamic var windDeg = 0
    var weather = List<Weather>()
}
