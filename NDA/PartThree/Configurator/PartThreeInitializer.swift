//
//  PartThreePartThreeInitializer.swift
//  NDA
//
//  Created by Dmitriy on 06/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartThreeModuleInitializer: NSObject {

    // Connect with object on storyboard
    @IBOutlet weak var partthreeViewController: PartThreeViewController!

    override func awakeFromNib() {
	super.awakeFromNib()
        let configurator = PartThreeModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: partthreeViewController)
    }

}
