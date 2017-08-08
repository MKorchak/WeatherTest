//
//  UIAlertController + Extensions.swift
//  WeatherTest
//
//  Created by Misha Korchak on 07.08.17.
//  Copyright © 2017 Misha Korchak. All rights reserved.
//

import UIKit

extension UIAlertController {
    static func presentSimpleError(title: String?, message: String?) -> UIAlertController {
        let allertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        allertController.addAction(cancelAction)
        
        return allertController
    }
}
