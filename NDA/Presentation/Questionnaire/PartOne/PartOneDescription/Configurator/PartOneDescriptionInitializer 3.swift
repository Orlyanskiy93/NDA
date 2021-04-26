//
//  PartOneDescriptionPartOneDescriptionInitializer.swift
//  NDA
//
//  Created by Dmitriy on 04/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartOneDescriptionModuleInitializer: NSObject {

    // Connect with object on storyboard
    @IBOutlet weak var partonedescriptionViewController: PartOneDescriptionViewController!

    override func awakeFromNib() {
	super.awakeFromNib()
        let configurator = PartOneDescriptionModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: partonedescriptionViewController)
    }

}
