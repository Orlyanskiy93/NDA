//
//  InformationInformationInteractor.swift
//  NDA
//
//  Created by Dmitriy on 09/05/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

class InformationInteractor: InformationInteractorInput {
    weak var output: InformationInteractorOutput!
    var informationService: InformationService!
    
    func getFAQArray() -> [FAQ] {
        let array = informationService.faq
        return array
    }
}
