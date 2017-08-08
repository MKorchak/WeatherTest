//
//  ViewController.swift
//  WeatherTest
//
//  Created by Misha Korchak on 05.08.17.
//  Copyright © 2017 Misha Korchak. All rights reserved.
//

import UIKit
import Material

protocol WeatherPage {
    func fill(from model: WeatherModel)
    func preparePageTabBarItem()
}

class MainViewController: PageTabBarController, PageTabBarControllerDelegate {
    
    private var weatherRequest: WeatherRequest!
    fileprivate var weatherParser: WeatherParser!
    fileprivate var headerView: HeaderView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepeareHeaderView()
        self.initialConfig()
    }
    
    override func prepare() {
        super.prepare()
        delegate = self
        preparePageTabBar()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let y = view.height - headerView.frame.size.height
        
        pageTabBar.height = headerView.frame.size.height - headerView.topView.frame.size.height
        pageTabBar.width = view.width + pageTabBar.layoutEdgeInsets.left + pageTabBar.layoutEdgeInsets.right
        
        rootViewController.view.height = y
        let height = headerView.frame.size.height - pageTabBar.height
        pageTabBar.y = height
        rootViewController.view.y = pageTabBar.y + pageTabBar.height
    }
    
    private func initialConfig() {
        self.weatherRequest = WeatherRequest(delegate: self)
        self.weatherParser = WeatherParser(delegate: self)
        self.weatherRequest.getWeather(forStation: Constants.Stations.aberporth)
    }
    
    private func prepeareHeaderView() {
        self.headerView = HeaderView.instanceFromNib() as! HeaderView
        self.headerView.addToSuperview(self)
        self.headerView.dropDownDataSource = [Constants.StationsNames.aberporth, Constants.StationsNames.armagh, Constants.StationsNames.ballypatrickForest, Constants.StationsNames.bradford]
        self.headerView.cityChangedBlock = { [weak self] station in
            self?.weatherRequest.getWeather(forStation: getStationCode(from: station))
        }
    }
}

extension MainViewController: WeatherRequestDelegate {
    func handleRequestResponse(response: String) {
        DispatchQueue.global(qos: .background).sync {
            self.weatherParser.parseWeather(from: response)
        }
    }
}

extension MainViewController: WeatherParserDelegate {
    func handleParsedResult(model: WeatherModel) {
        self.viewControllers.forEach({
            guard let viewController = $0 as? WeatherPage else {
                return
            }
            viewController.fill(from: model)
        })
    }
}

extension MainViewController {
    fileprivate func preparePageTabBar() {
        pageTabBar.lineAlignment = .bottom
        pageTabBar.lineColor = UIColor.white
        self.isBounceEnabled = false
        self.rootViewController.view.backgroundColor = UIColor(red: 244/255, green: 241/255, blue: 239/255, alpha: 1)
        pageTabBar.dividerThickness = 0
        pageTabBar.dividerColor = .lightGray
        pageTabBar.backgroundColor = .clear
    }
}

