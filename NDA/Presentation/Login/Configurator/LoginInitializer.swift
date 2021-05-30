//
//  LoginLoginInitializer.swift
//  NDA
//
//  Created by Dmitriy on 20/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class LoginModuleInitializer: NSObject {
    @IBOutlet weak var loginViewController: LoginViewController!

    override func awakeFromNib() {
        super.awakeFromNib()
        let configurator = LoginModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: loginViewController)
    }

}
