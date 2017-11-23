//
//  ProspectusRouter.swift
//  Aktif-DirectSellingSAS
//
//  Created by Esteban Caro on 22/11/17.
//  Copyright (c) 2017 Mateo. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol ProspectusRouterInput
{
  func navigateToSomewhere()
}

class ProspectusRouter: ProspectusRouterInput
{
  weak var viewController: ProspectusViewController!
  
  // MARK: - Navigation
  
  func navigateToSomewhere()
  {
    
  }
  
  // MARK: - Communication
  
  func passDataToNextScene(segue: UIStoryboardSegue)
  {
    // NOTE: Teach the router which scenes it can communicate with
    
    if segue.identifier == "ShowSomewhereScene" {
      passDataToSomewhereScene(segue: segue)
    }
  }
  
  func passDataToSomewhereScene(segue: UIStoryboardSegue)
  {
    // NOTE: Teach the router how to pass data to the next scene
    
    // let someWhereViewController = segue.destinationViewController as! SomeWhereViewController
    // someWhereViewController.output.name = viewController.output.name
  }
}