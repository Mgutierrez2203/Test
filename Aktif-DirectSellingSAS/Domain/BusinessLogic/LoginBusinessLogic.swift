//
//  LoginBusinessLogic.swift
//  Aktif-DirectSellingSAS
//
//  Created by Esteban Caro on 21/11/17.
//  Copyright (c) 2017 Mateo. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol LoginBusinessLogicBusinessLogicInput
{
  func doSomething(request: LoginBusinessLogic)
}

protocol LoginBusinessLogicBusinessLogicOutput
{
  func presentSomething(response: LoginBusinessLogic)
}

class LoginBusinessLogicBusinessLogic: LoginBusinessLogicBusinessLogicInput
{
  var output: LoginBusinessLogicBusinessLogicOutput!
  var repositoryLocator = RepositoryLocator().securityRepository()
  
  // MARK: - Business logic
  
  func doSomething(request: LoginBusinessLogic)
  {
    // NOTE: Use some repository to do the work
    
    // repositoryLocator.doSomeWork()

    // Map DTO response from repository to Domain model entity
    // let dtoResponse = MapperModel.convertToLoginBusinessLogic(dto: LoginBusinessLogicDTO)

    // NOTE: Pass the result to the Presenter
    
    let response = LoginBusinessLogic()
    output.presentSomething(response: response)
  }
}
