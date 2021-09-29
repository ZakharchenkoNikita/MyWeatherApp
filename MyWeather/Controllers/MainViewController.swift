//
//  ViewController.swift
//  MyWeather
//
//  Created by Nikita on 18.09.21.
//

import CoreLocation
import RealmSwift

class MainViewController: UIViewController {
    
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    
    @IBOutlet weak var conditionLabel: UILabel!
    
    @IBOutlet weak var conditionImage: UIImageView!
    
    var dataFetcherService = DataFetcherService()

    lazy var locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        return locationManager
    }()
    
    // MARK: Private properties
    private var currentWeather: Results<Weather>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestLocation()
        }
        currentWeather = StorageManager.shared.realm.objects(Weather.self)
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            print("таймер закончен")
        }
    }
    
    private func fetchWeather() {
        dataFetcherService.fetchWeather(cityName: "Odesa") { weather in
            if let weather = weather {
                if let name = self.currentWeather.first?.location?.name, name != "" {
//                    self.cityNameLabel.text = name
                } else {
                    StorageManager.shared.saveObject(object: weather)
                }
            }
        }
    }
    
    private func setupView(weather: Weather) {
        title = weather.location?.name ?? ""
        currentTempLabel.text = String(lround(weather.current?.tempC ?? 0))
        conditionLabel.text = weather.current?.condition?.text ?? ""
        feelsLikeLabel.text = String(lround(weather.current?.feelslikeC ?? 0))
    }
}

extension MainViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
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
                    print(weather.current?.lastUpdated)
                }
                setupView(weather: weather)
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
