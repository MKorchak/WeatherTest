//
//  MainNavigationController.swift
//  WeatherTest
//
//  Created by Misha Korchak on 07.08.17.
//  Copyright © 2017 Misha Korchak. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    
    lazy var mapViewController: MapViewController = {
        return UIStoryboard.viewController(identifier: "MapViewController") as! MapViewController
    }()
    
    lazy var weatherListViewController: WeatherListViewController = {
        return UIStoryboard.viewController(identifier: "WeatherListViewController") as! WeatherListViewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        let controller = MainViewController(viewControllers: [mapViewController, weatherListViewController], selectedIndex: 0)
        self.setViewControllers([controller], animated: true)
    }
}
