//
//  QuestionnaireInformationQuestionnaireInformationInitializer.swift
//  NDA
//
//  Created by Dmitriy on 01/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class QuestionnaireInformationModuleInitializer: NSObject {

    // Connect with object on storyboard
    @IBOutlet weak var questionnaireinformationViewController: QuestionnaireInformationViewController!

    override func awakeFromNib() {
	super.awakeFromNib()
        let configurator = QuestionnaireInformationModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: questionnaireinformationViewController)
    }

}
