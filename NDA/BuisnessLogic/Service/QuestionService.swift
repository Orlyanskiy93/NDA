//
//  QuestionBank.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 27.03.2021.
//

import Foundation

protocol QuestionService {
    var questionsPartOne: [QuestionPartOne] { get }
    var questionsPartTwo: [QuestionPartTwo] { get }
}
