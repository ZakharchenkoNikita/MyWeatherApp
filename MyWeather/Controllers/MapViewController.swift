//
//  MapViewController.swift
//  MyWeather
//
//  Created by Nikita on 19.09.21.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LocationManager.shared.start { [unowned self] location in
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            
            let center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
            let region = MKCoordinateRegion(center: center, span: span)
            mapView.setRegion(region, animated: true)
        }
    }
}
