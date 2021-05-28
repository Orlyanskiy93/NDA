//
//  LoginLoginViewController.swift
//  NDA
//
//  Created by Dmitriy on 20/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginViewInput {
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
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
        welcomeLabel.text = String.Login.welcomeMessage
        titleLabel.text = String.Login.title
        nameTextField.placeholder = String.Login.name
        ageTextField.placeholder = String.Login.age
        emailTextField.placeholder = String.Login.email
        continueButton.setTitle(String.Button.continue, for: .normal)
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
