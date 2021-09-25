//
//  Condition.swift
//  MyWeather
//
//  Created by Nikita on 18.09.21.
//

import RealmSwift

class Condition: Object, Decodable {
    @objc dynamic var text = ""
    @objc dynamic var icon = ""
    @objc dynamic var code = 0
}
