//
//  BaseViewController.swift
//  CustomNavBar
//
//  Created by Talish George on 30/07/19.
//  Copyright © 2019 Talish George. All rights reserved.
//

import UIKit
import OakLib

class BaseViewController: UIViewController {
    
    public var navBar = CustomNavigationView.loadNavigationBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.onLeftButtonAction = { success in
            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
            //self.navBar.navigationController()?.pushViewController(secondViewController, animated: true)
            self.navBar.hideProgressBar()
        }
        
        navBar.onRightButtonAction = { success in
            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
           self.navBar.navigationController()?.pushViewController(secondViewController, animated: true)
            //self.navBar.startProgress()
            //self.navBar.stratHorizontalProgressbar()
        }
        
        navBar.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(navBar)
        let safeGuide = self.view.safeAreaLayoutGuide
        navBar.setupSafeArea(guide: safeGuide)
        NavBarConstants.barBGColor = UIColor.init(hexString: "#0074b1", alpha: 1.0)
        NavBarConstants.transparentBGColor = UIColor.black.withAlphaComponent(0.5)
        NavBarConstants.leftNavButtonImage = UIImage(named: "back-navigation")!
        NavBarConstants.rightNavButtonImage = UIImage(named: "menu")!
        NavBarConstants.titleColor = UIColor.init(hexString: "#F3F3F3", alpha: 1.0)
        NavBarConstants.transparentTitleColor = UIColor.init(hexString: "#F3F3F3", alpha: 1.0)
        NavBarConstants.titleFont = UIFont.boldSystemFont(ofSize: 26)
        navBar.configureNavigationBar()
        //navBar.heightForLinearBar = 4
        //navBar.backgroundProgressBarColor = UIColor.black
        //navBar.progressBarColor = UIColor.white
    }
}

extension UIButton {
    
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        
        let inside = super.point(inside: point, with: event)
        
        if inside != isHighlighted && event?.type == .touches {
            isHighlighted = inside
        }
        
        return inside
        
    }
    
}
