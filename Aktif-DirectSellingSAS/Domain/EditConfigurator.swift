//
//  EditConfigurator.swift
//  Aktif-DirectSellingSAS
//
//  Created by Mateo Gutiérrez Díazon 23/11/17.
//  Copyright © 2017 Mateo. All rights reserved.
//

import UIKit

extension EditViewController  {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        router.passDataToNextScene(segue: segue)
    }
}

class EditConfigurator
{
    // MARK: - Object lifecycle
    
    static let sharedInstance = EditConfigurator()
    
    private init() {}
    
    // MARK: - Configuration
    
    func configure(viewController: EditViewController)
    {
        let router = EditRouter()
        router.viewController = viewController
        viewController.router = router
    }
}
