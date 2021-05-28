//
//  EditProfileEditProfileViewController.swift
//  NDA
//
//  Created by Dmitriy on 21/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController, EditProfileViewInput {
    @IBOutlet weak var editProfileNavigationItem: UINavigationItem!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
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
        editProfileNavigationItem.title = String.Login.editProfileNavigationItemTitle
        nameLabel.text = String.Login.name
        ageLabel.text = String.Login.age
        emailLabel.text = String.Login.email
        doneButton.setTitle(String.Button.done, for: .normal)
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
}
