//
//  EditProfileEditProfileViewController.swift
//  NDA
//
//  Created by Dmitriy on 21/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController, EditProfileViewInput {

    var output: EditProfileViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: EditProfileViewInput
    func setupInitialState() {
    }
}
