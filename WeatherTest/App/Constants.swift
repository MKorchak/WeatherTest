//
//  Constants.swift
//  WeatherTest
//
//  Created by Misha Korchak on 06.08.17.
//  Copyright © 2017 Misha Korchak. All rights reserved.
//

import Foundation

typealias Block = () -> Swift.Void
typealias responseString = (isSuccess: Bool, response: String?)
typealias ResponseBlock = (responseString) -> Swift.Void

struct Constants {
    struct Stations {
        static let armagh = "armaghdata"
        static let aberporth = "aberporthdata"
        static let ballypatrickForest = "ballypatrickdata"
        static let bradford = "bradforddata"
    }
    
    struct StationsNames {
        static let armagh = "Armagh"
        static let aberporth = "Aberporth"
        static let ballypatrickForest = "Ballypatrick Forest"
        static let bradford = "Bradford"
    }
}
