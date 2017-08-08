//
//  SectionView.swift
//  WeatherTest
//
//  Created by Misha Korchak on 08.08.17.
//  Copyright © 2017 Misha Korchak. All rights reserved.
//

import UIKit

class SectionView: UITableViewHeaderFooterView {

    @IBOutlet weak var yearLabel: UILabel!
    
    static func instanceFromNib() -> UIView {
        return UINib(nibName: "SectionView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
