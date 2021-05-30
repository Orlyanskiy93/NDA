//
//  InformationServiceImp.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 11.05.2021.
//

import Foundation

class InformationServiceImp: InformationService {
    static let shared = InformationServiceImp()
    var faq: [FAQ] = []
    
    private init() {
        faq = [
            FAQ(question: String.Information.information1Question, answer: String.Information.information1Answer),
            FAQ(question: String.Information.information2Question, answer: String.Information.information2Answer),
            FAQ(question: String.Information.information3Question, answer: String.Information.information3Answer),
            FAQ(question: String.Information.information4Question, answer: String.Information.information4Answer)
        ]
    }
}
