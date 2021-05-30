//
//  ProfileProfileInitializer.swift
//  NDA
//
//  Created by Dmitriy on 20/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class ProfileModuleInitializer: NSObject {
    @IBOutlet weak var profileViewController: ProfileViewController!

    override func awakeFromNib() {

        let configurator = ProfileModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: profileViewController)
    }

}
