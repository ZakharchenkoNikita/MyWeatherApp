//
//  User.swift
//  MyWeather
//
//  Created by Nikita on 29.09.21.
//

import RealmSwift

class User: Object {
    let cities = List<Cities>()
}

class Cities: Object {
    @objc dynamic var name = ""
    @objc dynamic var main: Main?
}
