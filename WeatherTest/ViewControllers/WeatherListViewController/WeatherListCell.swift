//
//  WeatherListCell.swift
//  WeatherTest
//
//  Created by Misha Korchak on 07.08.17.
//  Copyright © 2017 Misha Korchak. All rights reserved.
//

import UIKit

class WeatherListCell: UITableViewCell {

    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var tMaxLabel: UILabel!
    @IBOutlet weak var tMinLabel: UILabel!
    @IBOutlet weak var rainLabel: UILabel!
    @IBOutlet weak var sunLabel: UILabel!
    
    func fill(from model: MonthModel) {
        self.monthLabel.text = model.mm
        self.tMaxLabel.text = model.tmax
        self.tMinLabel.text = model.tmin
        self.rainLabel.text = model.rain
        self.sunLabel.text = model.sun
    }
}
