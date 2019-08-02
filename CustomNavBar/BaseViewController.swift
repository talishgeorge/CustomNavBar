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
    
    public var custNavBar = CNavBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        custNavBar = custNavBar.setupView()
        custNavBar.onLeftButtonAction = { success in
            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
            self.custNavBar.navigationController()?.pushViewController(secondViewController, animated: true)
        }
        
        custNavBar.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(custNavBar)
        
        let safeGuide = self.view.safeAreaLayoutGuide
        custNavBar.setupSafeAreaGuide(guide: safeGuide)
        custNavBar.setBGColor()
        custNavBar.hidePrgressBar()
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
