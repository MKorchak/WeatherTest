//
//  LocationModel.swift
//  WeatherTest
//
//  Created by Misha Korchak on 06.08.17.
//  Copyright © 2017 Misha Korchak. All rights reserved.
//

import Foundation

struct LocationModel {
    var latitude: Double
    var longtitude: Double
    
    init(latitude: Float, longtitude: Float) {
        self.latitude = Double(latitude)
        self.longtitude = Double(longtitude)
    }
}
