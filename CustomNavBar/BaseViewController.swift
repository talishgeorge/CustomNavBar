//
//  BaseViewController.swift
//  CustomNavBar
//
//  Created by Talish George on 30/07/19.
//  Copyright © 2019 Talish George. All rights reserved.
//

import UIKit
import CNavBarLib

class BaseViewController: UIViewController {
    
    public var navBar = CustomNavigationController.loadNavBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.onLeftButtonAction = { success in
            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
            self.navBar.navigationController()?.pushViewController(secondViewController, animated: true)
        }
        navBar.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(navBar)
        let safeGuide = self.view.safeAreaLayoutGuide
        navBar.setupSafeAreaGuide(guide: safeGuide)
        NavBarConstants.barBackgroundColor = NavBarConstants.barBackgroundColor
        NavBarConstants.leftNavButtonImage = UIImage(named: "back-navigation")!
        NavBarConstants.rightNavButtonImage = UIImage(named: "menu")!
        NavBarConstants.titleColor = UIColor.init(hexString: "#2E3033", alpha: 1.0)//UIColor.init(hexString: "#F3F3F3", alpha: 1.0)
        NavBarConstants.titleFont = UIFont.boldSystemFont(ofSize: 36)
        navBar.configureNavBar()
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
