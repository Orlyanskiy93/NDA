//
//  EditProfileEditProfileViewController.swift
//  NDA
//
//  Created by Dmitriy on 21/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController, EditProfileViewInput {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!

    var output: EditProfileViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func setupInitialState() {
        hideKeyboardWhenTaped()
    }

    func fill(with user: User) {
        nameTextField.text = user.name
        ageTextField.text = user.age
        emailTextField.text = user.email
    }

    @IBAction func edit(_ sender: Any) {
        let name = nameTextField.text ?? ""
        let age = ageTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let user = User(name: name, age: age, email: email)
        output.edit(user)
    }
    
//    @IBAction func hideKeyboard(_ sender: Any) {
//        self.view.endEditing(true)
//    }
}
