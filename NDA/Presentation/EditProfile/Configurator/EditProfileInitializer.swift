//
//  EditProfileEditProfileInitializer.swift
//  NDA
//
//  Created by Dmitriy on 21/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class EditProfileModuleInitializer: NSObject {
    @IBOutlet weak var editprofileViewController: EditProfileViewController!

    override func awakeFromNib() {

        let configurator = EditProfileModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: editprofileViewController)
    }

}
