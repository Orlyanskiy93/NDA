//
//  SessionDescriptionSessionDescriptionInitializer.swift
//  NDA
//
//  Created by Dmitriy on 18/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class SessionDescriptionModuleInitializer: NSObject {

    // Connect with object on storyboard
    @IBOutlet weak var sessiondescriptionViewController: SessionDescriptionViewController!

    override func awakeFromNib() {
	super.awakeFromNib()
        let configurator = SessionDescriptionModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: sessiondescriptionViewController)
    }

}
