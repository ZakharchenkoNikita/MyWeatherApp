//
//  Location.swift
//  MyWeather
//
//  Created by Nikita on 18.09.21.
//

import RealmSwift

class Location: Object, Decodable {
    @objc dynamic var name = ""
    @objc dynamic var region = ""
    @objc dynamic var country = ""
    @objc dynamic var lat = 0.0
    @objc dynamic var lon = 0.0
    @objc dynamic var tzId = ""
    @objc dynamic var localtimeEpoch = 0
    @objc dynamic var localtime = ""
}
