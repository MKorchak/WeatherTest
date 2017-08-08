//
//  UIViewController + Extensions.swift
//  WeatherTest
//
//  Created by Misha Korchak on 07.08.17.
//  Copyright © 2017 Misha Korchak. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentErrorController(title: String?, message: String?) {
        let controller = UIAlertController.presentSimpleError(title: title, message: message)
        self.present(controller, animated: true)
    }
}
