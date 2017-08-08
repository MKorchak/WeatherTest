//
//  HeaderView.swift
//  WeatherTest
//
//  Created by Misha Korchak on 07.08.17.
//  Copyright © 2017 Misha Korchak. All rights reserved.
//

import UIKit
import DropDown

class HeaderView: UIView {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var arrowImageView: UIImageView!
    @IBOutlet weak var stationLabel: UILabel!
    @IBOutlet weak var stationView: UIView!
    
    private let dropDown = DropDown()
    var dropDownDataSource: [String] = [] {
        didSet {
            guard !dropDownDataSource.isEmpty else {
                return
            }
            self.dropDown.dataSource = dropDownDataSource
            self.stationLabel.text = dropDownDataSource[0]
        }
    }
    
    var cityChangedBlock: ((_ city: String) -> Swift.Void)? = nil
    
    override func awakeFromNib() {
        self.stationView.makeBlur()
        self.prepareDropDown()
    }
    
    static func instanceFromNib() -> UIView {
        return UINib(nibName: "HeaderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    func addToSuperview(_ viewController: UIViewController) {
        let superview = viewController.view
        self.translatesAutoresizingMaskIntoConstraints = false
        superview?.addSubview(self)
        let top = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: superview, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0)
        
        let left = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: superview, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: 0)
        
        let right = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: superview, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: 0)
        
        let height = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 128)
        
        superview?.addConstraints([top, left, right, height])
    }
    
    private func prepareDropDown() {
        dropDown.dataSource = dropDownDataSource
        dropDown.anchorView = stationLabel
        dropDown.direction = .any
        dropDown.dismissMode = .onTap
        dropDown.selectionAction = { [weak self] (index, item) in
            guard let strongSelf = self else { return }
            strongSelf.stationLabel.text = item
            strongSelf.cityChangedBlock.map({ $0(item) })
        }
    }
    @IBAction func stationViewAction(_ sender: UITapGestureRecognizer) {
        self.dropDown.show()
    }
}
