//
//  WeatherParser.swift
//  WeatherTest
//
//  Created by Misha Korchak on 06.08.17.
//  Copyright © 2017 Misha Korchak. All rights reserved.
//

import Foundation
import String_Extensions

protocol WeatherParserDelegate {
    func handleParsedResult(model: WeatherModel)
    func handleParsingError()
}

extension WeatherParserDelegate where Self: UIViewController {    
    func handleParsingError() {
        self.presentErrorController(title: "Error", message: "In parsing")
    }
}

struct WeatherParser {
    private var delegate: WeatherParserDelegate
    
    init(delegate: WeatherParserDelegate) {
        self.delegate = delegate
    }
    
    func parseWeather(from data: String) {
        let years = self.getYearsArray(data: data)
        guard let location = self.getLocation(weatherData: data),
            let city = self.getCity(data: data),
            !years.isEmpty else {
            self.delegate.handleParsingError()
            return
        }
        let model = WeatherModel(city: city, location: location, years: years)
        self.delegate.handleParsedResult(model: model)
    }
    
    private func getCity(data: String) -> String? {
        let dataArray = data.lines()
        guard !dataArray.isEmpty else {
            return nil
        }
        return dataArray[0]
    }
    
    private func getLocation(weatherData data: String) -> LocationModel? {
        guard let mainData = data.between("Location", "Estimated"),
            let latitude = mainData.between("Lat ", " Lon")?.toFloat(),
            let longtitude = mainData.between("Lon ", ", ")?.toFloat() else {
            return nil
        }
        return LocationModel(latitude: latitude, longtitude: longtitude)
    }
    
    private func getYearsArray(data: String) -> [YearModel] {
        var mainData = data.replacingOccurrences(of: "#", with: "")
        mainData = mainData.replacingOccurrences(of: "Provisional", with: "")
        mainData = mainData.replacingOccurrences(of: "*", with: "")
        let weatherArray = data.chompLeft("hours\n").lines()
        var years: [YearModel] = []
        weatherArray.forEach {
            let yearData = $0.split(" ")
            guard !yearData.isEmpty else { return }
            var year = YearModel(year: yearData[0])
            let month = getMonth(array: yearData)
            if let currentIndex = years.index(of: year) {
                years[currentIndex].month.append(month)
            } else {
                year.month.append(month)
                years.append(year)
            }
        }
        return years
    }
    
    private func getMonth(array: [String]) -> MonthModel {
        var mm, tmax, tmin, af, rain, sun: String?
        for index in 0 ..< array.count - 1 {
            switch index {
            case 1: mm = array[index]
            case 2: tmax = array[index]
            case 3: tmin = array[index]
            case 4: af = array[index]
            case 5: rain = array[index]
            case 6: sun = array[index]
            default: break
            }
        }
        return MonthModel(mm: mm, tmax: tmax, tmin: tmin, af: af, rain: rain, sun: sun)
    }
}
