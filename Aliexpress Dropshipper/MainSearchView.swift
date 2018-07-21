//
//  MainSearchView.swift
//  Aliexpress Dropshipper
//
//  Created by Kevin Bai on 2018-07-19.
//  Copyright © 2018 Kevin Bai. All rights reserved.
//

import UIKit

class MainSearchView: UIView {
    let searchBarWrapper = UIView()
    let searchBar = UISearchBar()
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    init() {
        super.init(frame: CGRect.zero)
        self.backgroundColor = .white
        searchBarWrapper.backgroundColor = .gray
        searchBarWrapper.addToView(self, .left, .right, .top)
        searchBar.searchBarStyle = .minimal
        searchBar.addToView(self, .top(68.scaled.pad), .left, .right)
        
        //searchBarWrapper.y2Anchor = .bottom(searchBar.bottom, 20.scaled.pad)
    }
}
