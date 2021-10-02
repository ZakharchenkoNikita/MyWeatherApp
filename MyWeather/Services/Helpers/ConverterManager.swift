//
//  Converter.swift
//  MyWeather
//
//  Created by Nikita on 02.10.21.
//

import Foundation

class ConverterManager {
    static let shared = ConverterManager()
    
    private init() {}
    
    func celsiusFrom(kelvin: Double) -> Int {
        lround(kelvin - 273.15)
    }
}
