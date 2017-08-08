//
//  MapViewController.swift
//  WeatherTest
//
//  Created by Misha Korchak on 07.08.17.
//  Copyright © 2017 Misha Korchak. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    private var annotation: MKAnnotation?
    
    @IBOutlet weak var firstYearLabel: UILabel!
    @IBOutlet weak var lastYearLabel: UILabel!
    @IBOutlet weak var tMaxFirstLabel: UILabel!
    @IBOutlet weak var tMinFirstLabel: UILabel!
    @IBOutlet weak var tMaxLastLabel: UILabel!
    @IBOutlet weak var tMinLastLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        preparePageTabBarItem()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        preparePageTabBarItem()
    }
    
    fileprivate func setMapView(latitude: Double, longtitude: Double) {
        if let annotation = self.annotation {
            self.mapView.removeAnnotation(annotation)
        }
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
        let newAnnotation = MKPointAnnotation()
        newAnnotation.coordinate = coordinate
        self.mapView.addAnnotation(newAnnotation)
        self.annotation = newAnnotation
        let viewRegion = MKCoordinateRegionMake(coordinate, MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
        let adjustedRegion: MKCoordinateRegion = mapView.regionThatFits(viewRegion)
        self.mapView.setRegion(adjustedRegion, animated: true)
    }
    
    fileprivate func setProperties(model: WeatherModel) {
        let firstYear = model.years.first
        let lastYear = model.years.last
        self.firstYearLabel.text = "\(firstYear?.year ?? "") - "
        self.tMaxFirstLabel.text = "tmax: \(firstYear?.month.first?.tmax ?? "")"
        self.tMinFirstLabel.text = "tmin: \(firstYear?.month.first?.tmin ?? "")"
        
        self.lastYearLabel.text = "\(lastYear?.year ?? "") - "
        self.tMaxLastLabel.text = "tmax: \(lastYear?.month.last?.tmax ?? "")"
        self.tMinLastLabel.text = "tmin: \(lastYear?.month.last?.tmin ?? "")"
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let annotationIdentifier = "Identifier"
        var annotationView: MKAnnotationView?
        annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
        if let annotationView = annotationView {
            let image = UIImage(named: "flag")
            let size = CGSize(width: 50, height: 66)
            UIGraphicsBeginImageContext(size)
            image?.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            annotationView.canShowCallout = true
            annotationView.image = resizedImage
        }
        return annotationView
    }
}

extension MapViewController: WeatherPage {
    func fill(from model: WeatherModel) {
        self.setMapView(latitude: model.location.latitude, longtitude: model.location.longtitude)
        self.setProperties(model: model)
    }
    
    func preparePageTabBarItem() {
        pageTabBarItem.title = "MAP"
        pageTabBarItem.titleColor = .white
    }
}
