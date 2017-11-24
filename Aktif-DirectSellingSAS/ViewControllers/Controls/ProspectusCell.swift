//
//  ProspectusCell.swift
//  Aktif-DirectSellingSAS
//
//  Created by Mateo Gutiérrez Díaz on 22/11/17.
//  Copyright © 2017 Mateo. All rights reserved.
//

import Foundation
import UIKit

class ProspectusCell: UITableViewCell {
    
    // MARK: IBOutlet
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var documentLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    
    
    // MARK: - Member variables
    var router: ProspectusRouter!
    var token: String!
    var prospectus: Prospectus?{
        didSet{
            updateUI()
        }
    }
    
    func updateUI(){
        if prospectus != nil{
            self.nameLabel.text = prospectus!.name!
            self.lastNameLabel.text = prospectus!.lastName
            self.documentLabel.text = prospectus!.identification
            self.phoneLabel.text = prospectus!.phone
            self.codeLabel.text = "\(prospectus!.statusCode!)"
        }
    }
    
    // link button to Edit
    @IBAction func editButton(_ sender: Any) {
        self.router.goToEdit(prospectus: prospectus!, token: token!)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}





