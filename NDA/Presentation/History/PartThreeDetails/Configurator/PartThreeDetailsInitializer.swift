//
//  PartThreeDetailsPartThreeDetailsInitializer.swift
//  NDA
//
//  Created by Dmitriy on 18/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartThreeDetailsModuleInitializer: NSObject {

    // Connect with object on storyboard
    @IBOutlet weak var partthreedetailsViewController: PartThreeDetailsViewController!

    override func awakeFromNib() {
	super.awakeFromNib()
        let configurator = PartThreeDetailsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: partthreedetailsViewController)
    }

}
