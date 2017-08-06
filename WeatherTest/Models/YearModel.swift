//
//  YearModel.swift
//  WeatherTest
//
//  Created by Misha Korchak on 06.08.17.
//  Copyright © 2017 Misha Korchak. All rights reserved.
//

import Foundation

struct YearModel: Equatable {
    var year: String
    var month: [MonthModel] = []
    
    init(year: String) {
        self.year = year
    }
    
    public static func ==(lhs: YearModel, rhs: YearModel) -> Bool {
        return lhs.year == rhs.year
    }
}
