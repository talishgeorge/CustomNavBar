
//
//  ViewController.swift
//  CustomNavBar
//
//  Created by Talish George on 26/07/19.
//  Copyright © 2019 Talish George. All rights reserved.
//

import UIKit
import OakLib

class ViewController: BaseViewController {
    
    @IBOutlet weak var custCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        custCollectionView.delegate = self
        custCollectionView.dataSource = self
        NavBarConstants.leftNavButtonImage = UIImage()
        navBar.configureNavigationBar()
    }
}

extension ViewController: UICollectionViewDelegate,
    UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navBar.startHorizontalProgressbar()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        if (offset < -44) {
            //print("Scroll Offset =>", abs(offset))
            navBar.setTransparency(alpha: Float(offset))
            self.custCollectionView?.alpha = 0.5
        } else {
            //navBar.setBGColorWithAlpha(alpha: 1.0)
            self.custCollectionView?.alpha = 1.0
        }
    }
}

