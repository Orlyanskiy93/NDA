//
//  Part1Part1Initializer.swift
//  NDA
//
//  Created by Dmitriy on 26/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class Part1ModuleInitializer: NSObject {

    // Connect with object on storyboard
    @IBOutlet weak var part1ViewController: Part1ViewController!

    override func awakeFromNib() {
	super.awakeFromNib()
        let configurator = Part1ModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: part1ViewController)
    }

}
