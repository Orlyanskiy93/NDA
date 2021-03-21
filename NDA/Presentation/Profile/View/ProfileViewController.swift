//
//  ProfileProfileViewController.swift
//  NDA
//
//  Created by Dmitriy on 20/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, ProfileViewInput {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var eraseButton: UIButton!
    
    var output: ProfileViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        output.loadUser()
    }

    func setupInitialState() {
        editButton.layer.cornerRadius = 15
        eraseButton.layer.cornerRadius = 15
    }
    
    func fillLabelsBy(_ user: User) {
        nameLabel.text = user.name
        ageLabel.text = user.age
        emailLabel.text = user.email
    }
    
    
    @IBAction func edit(_ sender: UIButton) {
        output.openEditScreen()
    }
    
    @IBAction func erase(_ sender: Any) {
        output.openLoginScreen()
    }
}
