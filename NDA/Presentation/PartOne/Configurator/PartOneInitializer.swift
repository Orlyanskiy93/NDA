//
//  PartOnePartOneInitializer.swift
//  NDA
//
//  Created by Dmitriy on 26/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartOneModuleInitializer: NSObject {

    // Connect with object on storyboard
    @IBOutlet weak var partoneViewController: PartOneViewController!

    override func awakeFromNib() {
	super.awakeFromNib()
        let configurator = PartOneModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: partoneViewController)
    }

}
