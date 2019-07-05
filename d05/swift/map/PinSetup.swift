//
//  PinSetup.swift
//  d05
//
//  Created by Danyil ZBOROVKYI on 7/1/19.
//  Copyright © 2019 Danyil ZBOROVKYI. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

extension MapViewController {
    func setupPin(pin: MKPointAnnotation, place: Place) {
        pin.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(place.latitude), longitude: CLLocationDegrees(place.longitude))
        pin.title = place.title
        pin.subtitle = place.subTitle
        mapView.addAnnotation(pin)
    }
    
    func setPins() {
        setupPin(pin: pin42, place: placeList.placeList[0])
        pin42.pinColor = placeList.placeList[0].pinColor
        setupPin(pin: pinMc, place: placeList.placeList[1])
        pinMc.pinColor = placeList.placeList[1].pinColor
        setupPin(pin: pinFlat, place: placeList.placeList[2])
        pinFlat.pinColor = placeList.placeList[2].pinColor
        setupPin(pin: pinBukovel, place: placeList.placeList[3])
        pinBukovel.pinColor = placeList.placeList[3].pinColor
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }

        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "myAnnotation") as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "myAnnotation")
        } else {
            annotationView?.annotation = annotation
        }
        
        if let annotation = annotation as? PointAnnotation {
            annotationView?.pinTintColor = annotation.pinColor
        }
        
        annotationView?.canShowCallout = true
        
        return annotationView
    }
}
