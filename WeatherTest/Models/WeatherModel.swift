//
//  WeatherModel.swift
//  WeatherTest
//
//  Created by Misha Korchak on 06.08.17.
//  Copyright © 2017 Misha Korchak. All rights reserved.
//

import Foundation

struct WeatherModel {
    var city: String
    var location: LocationModel
    var years: [YearModel]
    
    init(city: String, location: LocationModel, years: [YearModel]) {
        self.city = city
        self.location = location
        self.years = years
    }
}
