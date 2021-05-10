//
//  LoginLoginViewController.swift
//  NDA
//
//  Created by Dmitriy on 20/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginViewInput {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var continueButton: UIButton!

    var output: LoginViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func setupInitialState() {
        hideKeyboardWhenTaped()
    }
        
    @IBAction func next(_ sender: UIButton) {
        let name = nameTextField.text ?? ""
        let age = ageTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let user = User(name: name, age: age, email: email)
        output.login(user)
    }
}
