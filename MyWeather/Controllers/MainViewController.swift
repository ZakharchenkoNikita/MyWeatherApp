//
//  ViewController.swift
//  MyWeather
//
//  Created by Nikita on 18.09.21.
//

import RealmSwift

class MainViewController: UIViewController {
    
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    
    @IBOutlet weak var conditionLabel: UILabel!
    
    @IBOutlet weak var conditionImage: UIImageView!
    
    var dataFetcherService = DataFetcherService()
    
    // MARK: Private properties
    private var currentWeather: Results<Weather>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentWeather = StorageManager.shared.realm.objects(Weather.self)
        getLocation()
    }
    
    private func setupView(weather: Weather) {
        
        title = weather.location?.name ?? ""
        
        currentTempLabel.text = String(lround(weather.current?.tempC ?? 0))
        feelsLikeLabel.text = String(lround(weather.current?.feelslikeC ?? 0))
        minTempLabel.text = String(lround(weather.forecast?.forecastday.first?.day?.mintempC ?? 0))
        maxTempLabel.text = String(lround(weather.forecast?.forecastday.first?.day?.maxtempC ?? 0))
        
        conditionLabel.text = weather.current?.condition?.text ?? ""
    }
    
    private func getLocation() {
        LocationManager.shared.start { [unowned self] location in
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            dataFetcherService.fetchWeather(latitude: latitude, longitude: longitude) { [unowned self] weather in
                if let weather = weather {
                    if currentWeather.first?.location == nil {
                        
                        let city = Cities()
                        city.name = weather.location?.name ?? ""
                        city.weather = weather
                        
                        let user = User()
                        user.cities.append(city)
                        
                        StorageManager.shared.saveObject(object: user)
                    } else {
                    }
                    setupView(weather: weather)
                }
            }
        }
    }
}

