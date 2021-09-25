//
//  Current.swift
//  MyWeather
//
//  Created by Nikita on 18.09.21.
//

import RealmSwift

class Current: Object, Decodable {
    @objc dynamic var lastUpdatedEpoch = 0
    @objc dynamic var lastUpdated = ""
    @objc dynamic var tempC = 0.0
    @objc dynamic var isDay = 0
    @objc dynamic var condition: Condition?
    @objc dynamic var feelslikeC = 0.0
    @objc dynamic var visKm = 0.0
}
