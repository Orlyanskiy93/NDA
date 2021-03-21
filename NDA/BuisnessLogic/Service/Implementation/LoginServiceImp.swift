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
    
    func add(_ user: User) {
        let name = user.name
        let age = user.age
        let email = user.email
        defaults.setValue(name, forKey: name)
        defaults.setValue(age, forKey: age)
        defaults.setValue(email, forKey: email)
    }
    
    func remove(_ user: User) {
        defaults.removeObject(forKey: user.name)
        defaults.removeObject(forKey: user.age)
        defaults.removeObject(forKey: user.email)
    }
}
