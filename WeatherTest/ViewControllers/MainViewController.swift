//
//  ViewController.swift
//  WeatherTest
//
//  Created by Misha Korchak on 05.08.17.
//  Copyright © 2017 Misha Korchak. All rights reserved.
//

import UIKit
import Material

class MainViewController: PageTabBarController, PageTabBarControllerDelegate {
    
    private var weatherRequest: WeatherRequest!
    fileprivate var weatherParser: WeatherParser!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialConfig()
    }
    
    private func initialConfig() {
        self.weatherRequest = WeatherRequest(delegate: self)
        self.weatherParser = WeatherParser(delegate: self)
        self.weatherRequest.getWeather(forStation: Constants.Stations.aberporth)
//        self.weatherRequest.getWeather(forStation: Constants.Stations.armagh)
//        self.weatherRequest.getWeather(forStation: "sdfgfds")
    }

}

extension MainViewController: WeatherRequestDelegate {
    func handleRequestResponse(response: String) {
        DispatchQueue.global(qos: .background).sync {
            self.weatherParser.parseWeather(from: response)
        }
    }
    
    func handleRequestError() {
        print("error")
//        self.indicator.stopAnimating()
//        self.indicator.isHidden = true
    }
}

extension MainViewController: WeatherParserDelegate {
    func handleParsedResult(model: WeatherModel) {
        print(model)
//        self.indicator.stopAnimating()
//        self.indicator.isHidden = true
    }
    
    func handleParsingError() {

    }
}

