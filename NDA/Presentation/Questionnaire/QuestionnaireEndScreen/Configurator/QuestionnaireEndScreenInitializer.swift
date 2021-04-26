//
//  QuestionnaireEndScreenQuestionnaireEndScreenInitializer.swift
//  NDA
//
//  Created by Dmitriy on 13/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class QuestionnaireEndScreenModuleInitializer: NSObject {

    // Connect with object on storyboard
    @IBOutlet weak var questionnaireendscreenViewController: QuestionnaireEndScreenViewController!

    override func awakeFromNib() {
	super.awakeFromNib()
        let configurator = QuestionnaireEndScreenModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: questionnaireendscreenViewController)
    }

}
