//
//  QuestionBank.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 27.03.2021.
//

import Foundation
import PromiseKit

protocol QuestionService {
    func getQuestionsPartOne() -> [QuestionPartOne]
    func getQuestioinsPartTwo(count: Int) throws -> [QuestionPartTwo]
    func getQuestionsPartThree() -> [QuestionPartThree]
    func getGunningFogIndex(with text: String) -> Promise<Double>
}
