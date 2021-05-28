//
//  InformationInformationInitializer.swift
//  NDA
//
//  Created by Dmitriy on 09/05/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class InformationModuleInitializer: NSObject {

    // Connect with object on storyboard
    @IBOutlet weak var informationViewController: InformationViewController!

    override func awakeFromNib() {
	super.awakeFromNib()
        let configurator = InformationModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: informationViewController)
    }

}
