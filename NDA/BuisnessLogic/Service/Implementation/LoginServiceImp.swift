//
//  LoginServiceImp.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 20.03.2021.
//

import Foundation

class LoginServiceImp: LoginService {
    static var shared = LoginServiceImp()
    private init() {}
    
    var defaults = UserDefaults.standard
    
    enum Keys: String {
        case name
        case age
        case email
    }
    
    func add(_ user: User) {
        let name = user.name
        let age = user.age
        let email = user.email
        defaults.setValue(name, forKey: Keys.name.rawValue)
        defaults.setValue(age, forKey: Keys.age.rawValue)
        defaults.setValue(email, forKey: Keys.email.rawValue)

    }
    
    func getUser() -> User {
        let name = defaults.string(forKey: Keys.name.rawValue) ?? ""
        let age = defaults.string(forKey: Keys.age.rawValue) ?? ""
        let email = defaults.string(forKey: Keys.email.rawValue) ?? ""
        let user = User(name: name, age: age, email: email)
        return user
    }
    
    func remove(_ user: User) {
        defaults.removeObject(forKey: Keys.name.rawValue)
        defaults.removeObject(forKey: Keys.age.rawValue)
        defaults.removeObject(forKey: Keys.email.rawValue)
    }
    
    
}
