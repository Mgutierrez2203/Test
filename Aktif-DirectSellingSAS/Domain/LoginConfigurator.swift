//
//  LoginConfigurator.swift
//  Aktif-DirectSellingSAS
//
//  Created by Esteban Caro on 21/11/17.
//  Copyright (c) 2017 Mateo. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// MARK: - Connect View, BusinessLogic, and Presenter

extension LoginConfiguratorViewController: LoginConfiguratorPresenterOutput
{
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    router.passDataToNextScene(segue: segue)
  }
}

extension LoginConfiguratorBusinessLogic: LoginConfiguratorViewControllerOutput
{
}

extension LoginConfiguratorPresenter: LoginConfiguratorBusinessLogicOutput
{
}

class LoginConfiguratorConfigurator
{
  // MARK: - Object lifecycle
  
  static let sharedInstance = LoginConfiguratorConfigurator()
  
  private init() {}
  
  // MARK: - Configuration
  
  func configure(viewController: LoginConfiguratorViewController)
  {
    let router = LoginConfiguratorRouter()
    router.viewController = viewController
    
    let presenter = LoginConfiguratorPresenter()
    presenter.output = viewController
    
    let interactor = LoginConfiguratorBusinessLogic()
    interactor.output = presenter
    
    viewController.output = interactor
    viewController.router = router
  }
}
