//
//  ViewController.swift
//  MyWeather
//
//  Created by Nikita on 18.09.21.
//

import RealmSwift
import CoreLocation

class MainViewController: UIViewController {
    
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    
    @IBOutlet weak var conditionLabel: UILabel!
    
    @IBOutlet weak var conditionImage: UIImageView!
    
    var dataFetcherService = DataFetcherService()
    
    // MARK: Private properties
    private var user: Results<User>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = StorageManager.shared.realm.objects(User.self)
        getLocation()
        setupView()
    }
    
    private func setupCity(mark: CLPlacemark) {
        title = mark.locality
    }
    
    private func setupView() {
        
        let currentTemp = ConverterManager.shared.celsiusFrom(kelvin: user.first?.cities.first?.main?.current?.temp ?? 0.0)

//        title = user.first?.cities.first?.name ?? "Test"

        currentTempLabel.text = String(currentTemp)
//        feelsLikeLabel.text = String(lround(weather.current?.feelslikeC ?? 0))
//        minTempLabel.text = String(lround(weather.forecast?.forecastday.first?.day?.mintempC ?? 0))
//        maxTempLabel.text = String(lround(weather.forecast?.forecastday.first?.day?.maxtempC ?? 0))

        conditionLabel.text = user.first?.cities.first?.main?.current?.weather.first?.weatherStatus
    }

    private func getLocation() {
        LocationManager.shared.start { [unowned self] location in
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            
            dataFetcherService.fetchWeather(latitude: latitude, longitude: longitude) { [unowned self] weather in
                if let weather = weather {
                    if user.first?.cities.first?.main == nil {
                        
                        let city = Cities()
                        city.name = weather.timezone
                        city.main = weather
                        
                        let user = User()
                        user.cities.append(city)

                        
                        StorageManager.shared.saveObject(object: user)
                    } else {
                    }
                }
            }
            
            LocationManager.shared.getPlace(location: location) { mark in
                guard let mark = mark else { return }
                setupCity(mark: mark)
            }
        }
    }
}

