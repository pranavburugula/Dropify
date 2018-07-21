//
//  MainSearchVC.swift
//  Aliexpress Dropshipper
//
//  Created by Kevin Bai on 2018-07-19.
//  Copyright © 2018 Kevin Bai. All rights reserved.
//

import UIKit

class MainSearchVC: UIViewController, UISearchBarDelegate {
    let overlayButton = UIButton()

    let mainView = MainSearchView()
    
    let apiCaller = APICaller()
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    init() {
        super.init(nibName: nil, bundle: nil)
        
        overlayButton.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        overlayButton.addTarget(self, action: #selector(removeOverlay), for: .touchUpInside)
        self.mainView.searchBar.delegate = self
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    @objc func removeOverlay() {
        self.mainView.searchBar.resignFirstResponder()
        UIView.animate(withDuration: 0.2, animations: {
            self.overlayButton.alpha = 0.0
        }, completion: { (Bool) in
            self.overlayButton.removeFromSuperview()
        })
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.view.addSubview(overlayButton)
        overlayButton.frame = self.view.frame
        overlayButton.alpha = 0.0
        UIView.animate(withDuration: 0.2) {
            self.overlayButton.alpha = 1.0
        }
        self.view.bringSubview(toFront: mainView.searchBar)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        removeOverlay()
    }
}
