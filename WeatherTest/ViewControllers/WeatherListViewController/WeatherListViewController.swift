//
//  WeatherListViewController.swift
//  WeatherTest
//
//  Created by Misha Korchak on 07.08.17.
//  Copyright © 2017 Misha Korchak. All rights reserved.
//

import UIKit

class WeatherListViewController: UIViewController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        preparePageTabBarItem()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        preparePageTabBarItem()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension WeatherListViewController: UITableViewDelegate, UITableViewDataSource {
    
}

extension WeatherListViewController: WeatherPage {
    func fill(from model: WeatherModel) {
        
    }
    
    func preparePageTabBarItem() {
        pageTabBarItem.title = "LIST"
        pageTabBarItem.titleColor = .white
    }
}
