//
//  InformationInformationInteractor.swift
//  NDA
//
//  Created by Dmitriy on 09/05/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

class InformationInteractor: InformationInteractorInput {
    weak var output: InformationInteractorOutput!
    
    func getStringsTuple() -> [(title: String, description: String)] {
        let informationStrings = [
            (title: String.Information.information1Title, description: String.Information.information1Description),
            (title: String.Information.information2Title, description: String.Information.information2Description),
            (title: String.Information.information3Title, description: String.Information.information3Description),
            (title: String.Information.information4Title, description: String.Information.information4Description)
        ]
//        let strings = [
//            String.Information.information1,
//            String.Information.information2,
//            String.Information.information3,
//            String.Information.information4
//        ]
        return informationStrings
    }
}
