//
//  BaseViewController.swift
//  Aktif-DirectSellingSAS
//
//  Created by Mateo Gutiérrez Díaz on 21/11/17.
//  Copyright © 2017 Mateo. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

open class BaseViewController: UIViewController {
    
    public func showProgressIndicator(){
        DispatchQueue.main.async {
            SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.custom)
            SVProgressHUD.setForegroundColor(UIColor.black.withAlphaComponent(0.8))
            SVProgressHUD.setBackgroundColor(UIColor.clear)
            SVProgressHUD.show()
        }
    }
    
    public func showProgressIndicatorWithMask(){
        DispatchQueue.main.async {
            SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.custom)
            SVProgressHUD.setForegroundColor(UIColor.black.withAlphaComponent(0.8))
            SVProgressHUD.setBackgroundColor(UIColor.clear)
            SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
            SVProgressHUD.show()
        }
    }
    
    public func showProgressIndicator(message : String?){
        DispatchQueue.main.async {
            SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.custom)
            SVProgressHUD.setForegroundColor(UIColor.black)
            SVProgressHUD.setBackgroundColor(UIColor.white)
            SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
            SVProgressHUD.show(withStatus: message)
        }
    }
    
    public func showProgressWaitIndicator(){
        self.showProgressIndicator(message: "MESSAGE_PROGRESSINDICATOR")
    }
    
    public func hideProgressIndicatorWithDelay(){
        DispatchQueue.main.async {
            SVProgressHUD.dismiss(withDelay: 0.5)
        }
    }
    
    public func hideProgressIndicator(){
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
}

