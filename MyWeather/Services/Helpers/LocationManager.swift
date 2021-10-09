//
//  LocationManager.swift
//  MyWeather
//
//  Created by Nikita on 02.10.21.
//

import CoreLocation

class LocationManager: NSObject {
    
    static let shared = LocationManager()
    
    var locationManager: CLLocationManager!
    var locationHandler: ((CLLocation) -> Void)!

    private override init() {}
    
    
    func start(_ locationHandler: @escaping ((_ location: CLLocation) -> Void)) {
        setupLocationManager()
        self.locationHandler = locationHandler
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func getPlace(location: CLLocation, completion: @escaping (CLPlacemark?) -> Void) {
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            guard let placemark = placemarks?.first else {
                completion(nil)
                return
            }
            completion(placemark)
        }
    }
    
    private func setupLocationManager() {
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
    }
}

//MARK: - CLLocationManager Delegates
extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationHandler(locations.last ?? CLLocation())
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined: locationManager.requestWhenInUseAuthorization()
        case .denied: print("Location Services are Disable")
        case .authorizedAlways, .authorizedWhenInUse: locationManager.startUpdatingLocation()
        case .authorized, .restricted: break
        @unknown default: break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        locationManager.stopUpdatingLocation()
    }
}
