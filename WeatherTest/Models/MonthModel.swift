//
//  MonthModel.swift
//  WeatherTest
//
//  Created by Misha Korchak on 06.08.17.
//  Copyright © 2017 Misha Korchak. All rights reserved.
//

import Foundation

struct MonthModel {
    var mm: String
    var tmax: String
    var tmin: String
    var af: String
    var rain: String
    var sun: String
    
    init(mm: String?, tmax: String?, tmin: String?, af: String?, rain: String?, sun: String?) {
        self.mm = mm ?? "---"
        self.tmax = tmax ?? "---"
        self.tmin = tmin ?? "---"
        self.af = af ?? "---"
        self.rain = rain ?? "---"
        self.sun = sun ?? "---"
    }
}
