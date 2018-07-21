//
//  TabBarVC.swift
//  Aliexpress Dropshipper
//
//  Created by Kevin Bai on 2018-07-19.
//  Copyright © 2018 Kevin Bai. All rights reserved.
//

import Foundation
import UIKit

class TabBarVC: UITabBarController {
    let mainSearchVC = MainSearchVC()
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    init() {
        super.init(nibName: nil, bundle: nil)

        let mainNavVC = customNavController(rootVC: mainSearchVC)
        self.setViewControllers([mainNavVC], animated: true)
        self.selectedViewController = mainNavVC
    }
    
    func customNavController(rootVC: UIViewController) -> UINavigationController {
        let navVC = UINavigationController(rootViewController: rootVC)
        
        //navVC.navigationBar.setBackgroundImage(UIImage(), for: .default)
        //navVC.navigationBar.shadowImage = UIImage()
        return navVC
    }
}
