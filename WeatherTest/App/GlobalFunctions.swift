//
//  GlobalFunctions.swift
//  WeatherTest
//
//  Created by Misha Korchak on 08.08.17.
//  Copyright © 2017 Misha Korchak. All rights reserved.
//

import Foundation

func getStationCode(from name: String) -> String {
    switch name {
    case Constants.StationsNames.aberporth:
        return Constants.Stations.aberporth
    case Constants.StationsNames.armagh:
        return Constants.Stations.armagh
    case Constants.StationsNames.ballypatrickForest:
        return Constants.Stations.ballypatrickForest
    case Constants.StationsNames.bradford:
        return Constants.Stations.bradford
    default:
        return ""
    }
}
