//
//  PartTwoPartTwoInitializer.swift
//  NDA
//
//  Created by Dmitriy on 28/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartTwoModuleInitializer: NSObject {
    @IBOutlet weak var parttwoViewController: PartTwoViewController!

    override func awakeFromNib() {
	super.awakeFromNib()
        let configurator = PartTwoModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: parttwoViewController)
    }

}
