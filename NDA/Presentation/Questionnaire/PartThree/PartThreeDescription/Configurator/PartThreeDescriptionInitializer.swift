//
//  PartThreeDescriptionPartThreeDescriptionInitializer.swift
//  NDA
//
//  Created by Dmitriy on 06/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartThreeDescriptionModuleInitializer: NSObject {

    // Connect with object on storyboard
    @IBOutlet weak var partthreedescriptionViewController: PartThreeDescriptionViewController!

    override func awakeFromNib() {
	super.awakeFromNib()
        let configurator = PartThreeDescriptionModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: partthreedescriptionViewController)
    }

}
