//
//  ViewController.swift
//  MyWeather
//
//  Created by Nikita on 18.09.21.
//

import UIKit

class ViewController: UIViewController {
    
    var dataFetcherService = DataFetcherService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataFetcherService.fetchWeather { weather in
            if let weather = weather {
                print(weather.current.tempC)
            }
        }
    }
}

