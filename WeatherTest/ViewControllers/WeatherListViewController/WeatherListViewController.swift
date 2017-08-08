//
//  WeatherListViewController.swift
//  WeatherTest
//
//  Created by Misha Korchak on 07.08.17.
//  Copyright © 2017 Misha Korchak. All rights reserved.
//

import UIKit

class WeatherListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var model: WeatherModel? {
        didSet {
            DispatchQueue.main.async {
                if let tableView = self.tableView {
                    tableView.reloadData()
                }
            }
        }
    }
    
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
        self.tableView.registerHeader(withClass: SectionView.self)
    }
}

extension WeatherListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.model?.years.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model?.years[section].month.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherListCell", for: indexPath) as! WeatherListCell
        if let model = self.model?.years[indexPath.section].month[indexPath.row] {
            cell.fill(from: model)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 67
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionView = tableView.dequeueHeader(cls: SectionView.self)
        sectionView.yearLabel.text = self.model?.years[section].year
        return sectionView
    }
}

extension WeatherListViewController: WeatherPage {
    func fill(from model: WeatherModel) {
        self.model = model
    }
    
    func preparePageTabBarItem() {
        pageTabBarItem.title = "LIST"
        pageTabBarItem.titleColor = .white
    }
}
