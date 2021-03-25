//
//  LoginServiceImp.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 20.03.2021.
//

import Foundation

class ProfileServiceImp: ProfileService {
    static var shared = ProfileServiceImp()
    private init() {}
    
    private var userDefaults = UserDefaults.standard
    
    func add(_ user: User) throws {
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(user) else {
            throw ProfileServiceError.saveUser
        }
        userDefaults.set(data, forKey: User.key)
    }
    
    func getUser() throws -> User {
        let decoder = JSONDecoder()
        guard let data = userDefaults.data(forKey: User.key),
              let user = try? decoder.decode(User.self, from: data) else {
            throw ProfileServiceError.getUser
        }
        return user
    }
    
    func removeUser() {
        userDefaults.removeObject(forKey: User.key)
    }
}
