//
//  EditRouter.swift
//  Aktif-DirectSellingSAS
//
//  Created by Mateo Gutiérrez Díaz on 23/11/17.
//  Copyright © 2017 Mateo. All rights reserved.
//

import UIKit

protocol EditRouterInput
{
    func goToProspectusFromEdit(prospectus: Prospectus, token: String)
}

class EditRouter: EditRouterInput
{
    weak var viewController: EditViewController!
    var prospectusViewController : ProspectusViewController!
    var prospectus: Prospectus?
    var token: String?
    
    // MARK: - Navigation
    func goToProspectusFromEdit(prospectus: Prospectus, token: String)
    {
        self.prospectus = prospectus
        self.token = token
        viewController.performSegue(withIdentifier: "segueToProspectsFromEdit", sender: nil)
    }
    
    // MARK: - Communication
    
    func passDataToNextScene(segue: UIStoryboardSegue)
    {
        if segue.identifier == "segueToProspectsFromEdit" {
            passDataToProspectusScene(segue: segue)
        }
    }
    
    func passDataToProspectusScene(segue: UIStoryboardSegue)
    {
        self.prospectusViewController = segue.destination as! ProspectusViewController
        self.prospectusViewController.token = self.token
    }
}

