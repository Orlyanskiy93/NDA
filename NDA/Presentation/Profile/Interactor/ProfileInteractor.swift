//
//  ProfileProfileInteractor.swift
//  NDA
//
//  Created by Dmitriy on 20/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

class ProfileInteractor: ProfileInteractorInput {
    weak var output: ProfileInteractorOutput!
    var profileService: ProfileService!
    var dataService: QuestionnaireDataService!
    var timerService: TimerService!
    
    func loadUser() -> User? {
        do {
            let user = try profileService.getUser()
            return user
        } catch {
            output.handle(error)
            return nil
        }
    }
    
    func removeUser() {
        do {
            try dataService.clearHistory()
            profileService.removeUser()
            timerService.stopTimer()
        } catch {
            output.handle(error)
        }
    }
    
}
