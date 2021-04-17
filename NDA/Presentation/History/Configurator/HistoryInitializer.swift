//
//  HistoryHistoryInitializer.swift
//  NDA
//
//  Created by Dmitriy on 17/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class HistoryModuleInitializer: NSObject {

    // Connect with object on storyboard
    @IBOutlet weak var historyViewController: HistoryViewController!

    override func awakeFromNib() {
	super.awakeFromNib()
        let configurator = HistoryModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: historyViewController)
    }

}
