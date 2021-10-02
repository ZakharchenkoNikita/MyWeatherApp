//
//  Main.swift
//  MyWeather
//
//  Created by Nikita on 02.10.21.
//

import RealmSwift

class Main: Object, Decodable {
    @objc dynamic var lat = 0.0
    @objc dynamic var lon = 0.0
    @objc dynamic var timezone = ""
    @objc dynamic var timezoneOffset = 0
    @objc dynamic var current: Current?
}
