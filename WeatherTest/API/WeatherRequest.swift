//
//  File.swift
//  WeatherTest
//
//  Created by Misha Korchak on 05.08.17.
//  Copyright © 2017 Misha Korchak. All rights reserved.
//

import Foundation
import Alamofire

protocol WeatherRequestDelegate {
    func handleRequestResponse(response: String)
    func handleRequestError()
}

extension WeatherRequestDelegate where Self: UIViewController {
    func handleRequestError() {
        self.presentErrorController(title: "Error", message: "In request")
    }
}

struct WeatherRequest {
    
    private var delegate: WeatherRequestDelegate
    
    init(delegate: WeatherRequestDelegate) {
        self.delegate = delegate
    }
    
    func getWeather(forStation station: String) {
        Alamofire.request("http://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/\(station).txt").validate().responseString { response in
            guard response.result.isSuccess, let result = response.result.value else {
                self.delegate.handleRequestError()
                return
            }
            self.delegate.handleRequestResponse(response: result)
        }
    }
}
