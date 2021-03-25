//
//  File.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 20.03.2021.
//

import UIKit

class FileViewController: UIViewController {
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var email: UITextField!
    var loginService = LoginServiceImp.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func add(_ sender: UIButton) {
        let name = self.name.text ?? ""
        let age = 5
        let email = self.email.text ?? ""
        let user = User(name: name, age: age, email: email)
        loginService.add(user)
    }
    
}
