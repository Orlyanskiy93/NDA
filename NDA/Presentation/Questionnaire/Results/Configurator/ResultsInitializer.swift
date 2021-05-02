//
//  QuestionnaireEndScreenQuestionnaireEndScreenInitializer.swift
//  NDA
//
//  Created by Dmitriy on 13/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class ResultsModuleInitializer: NSObject {

    // Connect with object on storyboard
    @IBOutlet weak var resultsViewController: ResultsViewController!

    override func awakeFromNib() {
	super.awakeFromNib()
        let configurator = ResultsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: resultsViewController)
    }

}
