//
//  QuestionBank.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 27.03.2021.
//

import Foundation
import PromiseKit

protocol QuestionService {
    var answersPartOne: [AnswerPartOne] { get set }
    var scorePartOne: Double { get set }
    var answersPartTwo: [AnswerPartTwo] { get set }
    var scorePartTwo: Double { get set }
    var answerPartThree: AnswerPartThree? { get set }
    var scorePartThree: Double { get set }
    var avetrageScore: Double? { get }
    var completionDate: Date? { get set }
    
    func getQuestionsPartOne() -> [QuestionPartOne]
    func getQuestioinsPartTwo(count: Int) throws -> [QuestionPartTwo]
    func getGunningFogIndex(with text: String) -> Promise<Double>
}
