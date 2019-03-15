//
//  RegisterViewController.swift
//  login
//
//  Created by Alan Vargas on 3/1/19.
//  Copyright © 2019 Alan Vargas. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var acceptButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        emailTextField.becomeFirstResponder()
    }
    
    
    func setup(){
        navigationItem.title = "Signup"
        acceptButton.backgroundColor = UIColor.myNavBarBackground()
        acceptButton.setTitleColor(UIColor.white, for: .normal)
        acceptButton.layer.cornerRadius = 5.0
    }

    @IBAction func hideKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
