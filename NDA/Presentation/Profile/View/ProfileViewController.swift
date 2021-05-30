//
//  ProfileProfileViewController.swift
//  NDA
//
//  Created by Dmitriy on 20/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, ProfileViewInput {
    @IBOutlet weak var profileNavigationItem: UINavigationItem!
    @IBOutlet weak var titleNameLabel: UILabel!
    @IBOutlet weak var titleAgeLabel: UILabel!
    @IBOutlet weak var titleEmailLabel: UILabel!
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
        super.viewWillAppear(animated)
        output.loadUser()
    }

    func setupInitialState() {
        profileNavigationItem.title = String.Login.profileNavigationItemTitle
        titleNameLabel.text = String.Login.name
        titleAgeLabel.text = String.Login.age
        titleEmailLabel.text = String.Login.email
        editButton.setTitle(String.Button.editInformation, for: .normal)
        eraseButton.setTitle(String.Button.eraceAppData, for: .normal)
    }
    
    func fillLabels(with user: User) {
        nameLabel.text = user.name
        ageLabel.text = user.age
        emailLabel.text = user.email
    }
    
    @IBAction func edit(_ sender: UIButton) {
        output.openEditScreen()
    }
    
    @IBAction func erase(_ sender: Any) {
        output.removeUserAndHistory()
    }
}
