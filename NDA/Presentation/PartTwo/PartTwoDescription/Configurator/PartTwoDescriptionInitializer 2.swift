//
//  PartTwoDescriptionPartTwoDescriptionInitializer.swift
//  NDA
//
//  Created by Dmitriy on 04/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartTwoDescriptionModuleInitializer: NSObject {

    // Connect with object on storyboard
    @IBOutlet weak var parttwodescriptionViewController: PartTwoDescriptionViewController!

    override func awakeFromNib() {
	super.awakeFromNib()
        let configurator = PartTwoDescriptionModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: parttwodescriptionViewController)
    }

}
