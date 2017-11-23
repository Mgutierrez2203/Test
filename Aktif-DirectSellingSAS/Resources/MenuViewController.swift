//
//  MenuViewController.swift
//  Aktif-DirectSellingSAS
//
//  Created by Esteban Caro on 22/11/17.
//  Copyright © 2017 Mateo. All rights reserved.
//

import Foundation
import SlideMenuControllerSwift

open class MenuViewController: UIViewController {
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setRightMenuButton()
    }
    
    public func setRightMenuButton(){
        let menuImage = UIImage.init(named: "", in:  Bundle(identifier: ""), compatibleWith: nil)?.withRenderingMode(.alwaysOriginal)
        // Set the menu right bar button on the last wrapper that is displaying.
        self.navigationController?.viewControllers.last?.navigationItem.rightBarButtonItem = UIBarButtonItem(image: menuImage, style: .plain, target: self, action: #selector(openMenu(sender:)))
    }
    
    @objc private func openMenu(sender: UIBarButtonItem){
        self.slideMenuController()?.openRight()
    }
}
