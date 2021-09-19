//
//  ViewController.swift
//  MyWeather
//
//  Created by Nikita on 18.09.21.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    
    var dataFetcherService = DataFetcherService()
    
    var menuItems: [UIAction] = []
    var searchMenu: UIMenu {
        UIMenu(
            options: [.displayInline],
            children: menuItems
        )
    }
    
    lazy var locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        return locationManager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuItems = setupMenuItems()
        setupMenuButtons()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestLocation()
        }
    }
}

// MARK: Work with menu
extension MainViewController {
    private func setupMenuItems() -> [UIAction] {
        [
            UIAction(
                title: "City name",
                image: UIImage(systemName: "building"),
                handler: { _ in
                    print("Тест...")
                }
            ),
            UIAction(
                title: "Map",
                image: UIImage(systemName: "location.circle"),
                handler: { _ in
                    print("Тест...")
                }
            )
        ]
    }
    
    private func setupMenuButtons() {
        let addNewButton = UIBarButtonItem(
            image: UIImage(systemName: "plus.square.fill"),
            menu: searchMenu)
        navigationItem.rightBarButtonItems = [addNewButton]
    }
    
    private func setupView(weather: Weather) {
        cityNameLabel.text = weather.location.name
        currentTempLabel.text = String(lround(weather.current.tempC))
    }
}

extension MainViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        dataFetcherService.fetchWeather(latitude: latitude, longitude: longitude) { [unowned self] weather in
            if let weather = weather {
                setupView(weather: weather)
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
