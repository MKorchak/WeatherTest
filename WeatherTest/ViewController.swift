//
//  ViewController.swift
//  WeatherTest
//
//  Created by Misha Korchak on 05.08.17.
//  Copyright © 2017 Misha Korchak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var weatherRequest: WeatherRequest!
    fileprivate var weatherParser: WeatherParser!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.weatherRequest = WeatherRequest(delegate: self)
        self.weatherParser = WeatherParser(delegate: self)
        self.weatherRequest.getWeather(forStation: Constants.Stations.aberporth)
        self.weatherRequest.getWeather(forStation: Constants.Stations.armagh)
        self.weatherRequest.getWeather(forStation: "sdfgfds")
    }

}

extension ViewController: WeatherRequestDelegate {
    func handleRequestResponse(response: String) {
        self.weatherParser.parseWeather(from: response)
    }
    
    func handleRequestError() {
        print("error")
    }
}

extension ViewController: WeatherParserDelegate {
    func handleParsedResult(model: WeatherModel) {
        print(model)
    }
    
    func handleParsingError() {
        
    }
}

