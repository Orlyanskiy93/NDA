//
//  PartTwoDetailsPartTwoDetailsInitializer.swift
//  NDA
//
//  Created by Dmitriy on 18/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartTwoDetailsModuleInitializer: NSObject {

    // Connect with object on storyboard
    @IBOutlet weak var parttwodetailsViewController: PartTwoDetailsViewController!

    override func awakeFromNib() {
	super.awakeFromNib()
        let configurator = PartTwoDetailsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: parttwodetailsViewController)
    }

}
