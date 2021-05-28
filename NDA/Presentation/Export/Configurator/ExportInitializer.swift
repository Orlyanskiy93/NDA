//
//  ExportExportInitializer.swift
//  NDA
//
//  Created by Dmitriy on 07/05/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class ExportModuleInitializer: NSObject {

    // Connect with object on storyboard
    @IBOutlet weak var exportViewController: ExportViewController!

    override func awakeFromNib() {
	super.awakeFromNib()
        let configurator = ExportModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: exportViewController)
    }

}
