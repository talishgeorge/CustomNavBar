//
//  ViewController.swift
//  CustomNavBar
//
//  Created by Talish George on 26/07/19.
//  Copyright © 2019 Talish George. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let custNavBar = CNavBar.getScreen()
        custNavBar.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(custNavBar)
        let safeGuide = self.view.safeAreaLayoutGuide
        custNavBar.setupSafeAreaGuide(guide: safeGuide)
        //let loadingBar: LoadingView = LoadingView()
        //loadingBar.startAnimating()
        custNavBar.startProgress()
    }
}

