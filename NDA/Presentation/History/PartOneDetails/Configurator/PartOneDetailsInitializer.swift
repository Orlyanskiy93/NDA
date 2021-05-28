//
//  PartOneDetailsPartOneDetailsInitializer.swift
//  NDA
//
//  Created by Dmitriy on 18/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartOneDetailsModuleInitializer: NSObject {

    // Connect with object on storyboard
    @IBOutlet weak var partonedetailsViewController: PartOneDetailsViewController!

    override func awakeFromNib() {
	super.awakeFromNib()
        let configurator = PartOneDetailsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: partonedetailsViewController)
    }

}
