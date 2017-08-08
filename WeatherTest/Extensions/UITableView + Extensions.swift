//
//  UITableView + Extensions.swift
//  WeatherTest
//
//  Created by Misha Korchak on 08.08.17.
//  Copyright © 2017 Misha Korchak. All rights reserved.
//

import UIKit

extension UITableView {
    func registerHeader(withClass cls: AnyClass?) {
        if let cls = cls {
            let name = String(describing: cls.self)
            let nib = UINib.init(nibName: name, bundle: nil)
            self.register(nib, forHeaderFooterViewReuseIdentifier: name)
        }
    }
    
    func dequeueHeader<T>(cls: T.Type) -> T {
        let clsString = String(describing: T.self)
        return self.dequeueReusableHeaderFooterView(withIdentifier: clsString) as! T
    }
}
