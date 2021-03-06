//
//  LoginConfigurator.swift
//  Aktif-DirectSellingSAS
//
//  Created by Mateo Gutiérrez Díaz on 21/11/17.
//  Copyright (c) 2017 Mateo. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

extension LoginViewController: LoginPresenterOutput
{
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    router.passDataToNextScene(segue: segue)
  }
}

extension LoginBusinessLogic: LoginViewControllerOutput
{
    
}

extension LoginPresenter: LoginBusinessLogicOutput
{

}

class LoginConfigurator
{
  // MARK: - Object lifecycle
  
  static let sharedInstance = LoginConfigurator()
  
  private init() {}
  
  // MARK: - Configuration
  
  func configure(viewController: LoginViewController)
  {
    let router = LoginRouter()
    router.viewController = viewController
    
    let presenter = LoginPresenter()
    presenter.output = viewController
    
    let interactor = LoginBusinessLogic()
    interactor.output = presenter
    
    viewController.output = interactor
    viewController.router = router
  }
}
