//
//  EditViewController.swift
//  Aktif-DirectSellingSAS
//
//  Created by Mateo Gutiérrez Díaz on 23/11/17.
//  Copyright © 2017 Mateo. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Member variables
    var prospectus = Prospectus()
    var router: EditRouter!
    var base: BaseViewController!
    
    // MARK: IBOutlet
    @IBOutlet weak var identificationLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var statusCodeLabel: UILabel!
    
    
    // MARK: - Object lifecycle
    override func awakeFromNib()
    {
        super.awakeFromNib()
        EditConfigurator.sharedInstance.configure(viewController: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        displayProspectData()
        nameTextField.delegate = self
        lastNameTextField.delegate = self
        phoneTextField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func displayProspectData() {
        self.identificationLabel.text = self.prospectus.identification!
        self.statusCodeLabel.text = "\(self.prospectus.statusCode!)"
        self.nameTextField.placeholder = self.prospectus.name!
        self.lastNameTextField.placeholder = self.prospectus.lastName!
        self.phoneTextField.placeholder = self.prospectus.phone!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true);
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: UI Actions
    @IBAction func saveButton(_ sender: Any) {
        dismissKeyboard()
        validateFields(name: self.nameTextField.text!, lastName: self.lastNameTextField.text!, phone: self.phoneTextField.text!)
    }
    
    func validateFields(name: String!, lastName: String!, phone: String!){
        if name.isEmpty || lastName.isEmpty || phone.isEmpty {
            print("Todos los campos son obligatorios")
        }
        self.router.goToProspectusFromEdit(prospectus: prospectus)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.nameTextField:
            self.lastNameTextField.becomeFirstResponder()
        case self.lastNameTextField:
            self.phoneTextField.becomeFirstResponder()
        default:
            self.view.endEditing(true)
        }
        return false
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


