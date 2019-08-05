//
//  DetailsViewController.swift
//  CustomNavBar
//
//  Created by Talish George on 30/07/19.
//  Copyright © 2019 Talish George. All rights reserved.
//

import UIKit

class DetailsViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.onLeftButtonAction = { success in
        self.navBar.navigationController()?.popViewController(animated: true)
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
