//
//  ProspectusPresenter.swift
//  Aktif-DirectSellingSAS
//
//  Created by Esteban Caro on 22/11/17.
//  Copyright (c) 2017 Mateo. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol ProspectusPresenterPresenterInput
{
  func presentSomething(response: ProspectusPresenter)
}

protocol ProspectusPresenterPresenterOutput: class
{
  func displaySomething(viewModel: ProspectusPresenter)
}

class ProspectusPresenterPresenter: ProspectusPresenterPresenterInput
{
  weak var output: ProspectusPresenterPresenterOutput!
  
  // MARK: - Presentation logic
  
  func presentSomething(response: ProspectusPresenter)
  {
    // NOTE: Format the response from the Interactor and pass the result back to the View Controller
    
    let viewModel = ProspectusPresenter()
    output.displaySomething(viewModel: viewModel)
  }
}
