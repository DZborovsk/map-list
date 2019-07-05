//
//  FirstViewController.swift
//  d05
//
//  Created by Danyil ZBOROVKYI on 7/1/19.
//  Copyright © 2019 Danyil ZBOROVKYI. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    var placeList: PlaceList = PlaceList()
    var locationManager = CLLocationManager()
    var toggleLocationButton = false
    
    let pin42 = PointAnnotation()
    let pinMc = PointAnnotation()
    let pinFlat = PointAnnotation()
    let pinBukovel = PointAnnotation()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPins()
        centerMap(location: pin42)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let myLocation = CLLocationCoordinate2D(latitude: placeList.placeList[indexPlace].latitude,
                                                 longitude: placeList.placeList[indexPlace].longitude)
        let region = MKCoordinateRegion(center: myLocation, span: span)
        
        let pin = PointAnnotation()
        pin.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(placeList.placeList[indexPlace].latitude),
                                         longitude: CLLocationDegrees(placeList.placeList[indexPlace].longitude))
        pin.title = placeList.placeList[indexPlace].title
        pin.subtitle = placeList.placeList[indexPlace].subTitle
        
        pin.pinColor = placeList.placeList[indexPlace].pinColor
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(pin)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //Access the last object from locations to get perfect current location
        if let location = locations.last {
            let span = MKCoordinateSpan.init(latitudeDelta: 0.005, longitudeDelta: 0.005)
            let myLocation = CLLocationCoordinate2DMake(location.coordinate.latitude,location.coordinate.longitude)
            let region = MKCoordinateRegion.init(center: myLocation, span: span)
            mapView.setRegion(region, animated: true)
        }
        self.mapView.showsUserLocation = true
    }
    
    @IBAction func locationButton(_ sender: UIButton) {
        if !toggleLocationButton {
            self.locationManager.requestWhenInUseAuthorization()
            if CLLocationManager.locationServicesEnabled() {
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                locationManager.startUpdatingLocation()
            }
            locationManager.startUpdatingLocation()
            mapView.setUserTrackingMode(MKUserTrackingMode.follow, animated: true)
            self.toggleLocationButton = true
        } else {
            locationManager.stopUpdatingLocation()
            self.toggleLocationButton = false
        }
        
    }
    
    @IBAction func setSegmentationControl(_ sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        default:
            mapView.mapType = .hybrid
        }
    }
    
    func centerMap(location: MKPointAnnotation) {
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, span: span)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
}

