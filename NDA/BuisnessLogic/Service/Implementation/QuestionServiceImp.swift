//
//  QuestionBankImp.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 27.03.2021.
//

import Foundation
import Alamofire
import PromiseKit

class QuestionServiceImp: QuestionService {
    static var shared = QuestionServiceImp()
    
    var sessions: [Session] = []
    var currentSession: Session?

    private init() {}
    
    func getQuestionsPartOne() -> [QuestionPartOne] {
        let questions = QuestionBank.shared.questionsPartOne
        return questions
    }
    
    func getQuestioinsPartTwo(count: Int) throws -> [QuestionPartTwo] {
        var arithmeticQuestions = [QuestionPartTwo]()
        var identifyQuestions = [QuestionPartTwo]()
        for _ in 0..<count / 2 {
            do {
                let arithmeticQuestion = try QuestionPartTwo(type: .text)
                arithmeticQuestions.append(arithmeticQuestion)
                let identifyQuestion = try QuestionPartTwo(type: .image)
                identifyQuestions.append(identifyQuestion)
            } catch {
                throw error
            }
        }
        
        let questionsPartTwo = arithmeticQuestions + identifyQuestions
        return questionsPartTwo.shuffled()
    }
    
    func getQuestionsPartThree() -> [QuestionPartThree] {
        let questions = QuestionBank.shared.questionsPartThree
        return questions
    }
    
    func getGunningFogIndex(with text: String) -> Promise<Double> {
        let url = URL(string: "https://ipeirotis-readability-metrics.p.rapidapi.com/getReadabilityMetrics")!
        let headers: HTTPHeaders = [
            "x-rapidapi-host": "ipeirotis-readability-metrics.p.rapidapi.com",
            "x-rapidapi-key": "9e3e4ba00amsh77ecb2a6ef93b17p1bc968jsn122bb0d8500f",
            "content-type": "application/x-www-form-urlencoded",
            "useQueryString": "true"
        ]
        let parametrs: Parameters = ["text": text]
        return Promise { seal in
            AF.request(url, method: .post, parameters: parametrs, headers: headers).validate().responseJSON { (response) in
                switch response.result {
                case .success(let data):
                    do {
                        guard let dict = data as? [String: Double],
                              let gfIndex = dict["GUNNING_FOG"] else {
                            throw QuestionError.mapping
                        }
                        seal.fulfill(gfIndex)
                    } catch {
                        seal.reject(error)
                    }
                case .failure(let error):
                    guard let data = response.data,
                          let dict = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                          let errorsArray = (dict["error"] as? [String: Any])?["errors"] as? [Any],
                          let reasonMessage = (errorsArray.first as? [String: Any])?["reason"] as? String else {
                        seal.reject(error)
                        return
                    }
                    let requestError = QuestionError.custom(reasonMessage)
                    seal.reject(requestError)
                }
            }
        }
    }
}

extension QuestionServiceImp: SessionManager {
        
    func beginSession() {
        currentSession = Session()
        currentSession?.stage = .partOne
    }
    
    func save(_ partOne: AnswerPartOne) {
        currentSession?.answersPartOne.append(partOne)
        currentSession?.stage = .partTwo
    }
    
    func save(_ partTwo: AnswerPartTwo) {
        currentSession?.answersPartTwo.append(partTwo)
        currentSession?.stage = .partThree
    }
    
    func save(_ partThree: AnswerPartThree) {
        currentSession?.answerPartThree = partThree
        currentSession?.stage = .finished
        
    }
    
    func saveSession() throws {
        let completionDate = Date()
        currentSession?.completionDate = completionDate
        guard let session = currentSession else {
            throw SessionError.saving
        }
        sessions.append(session)
    }
    
}
