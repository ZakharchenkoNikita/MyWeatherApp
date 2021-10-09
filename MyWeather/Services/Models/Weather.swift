//
//  Weather.swift
//  MyWeather
//
//  Created by Nikita on 18.09.21.
//

import RealmSwift

class Weather: Object, Decodable {
    @objc dynamic var id = 0
    @objc dynamic var main = ""
    @objc dynamic var weatherDescription = ""
    
    var weatherStatus: String {
        "\(main) (\(weatherDescription))"
    }
    
    enum CodingKeys: String, CodingKey {
        case id, main, weatherDescription = "description"
    }
}
