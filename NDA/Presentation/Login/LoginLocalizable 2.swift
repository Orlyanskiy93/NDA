//
//  LoginLocalizable.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 11.04.2021.
//

import UIKit

class LoginLocalizable: NSObject {
    
    @IBOutlet weak var welcomLabel: UILabel! {
        didSet {
            welcomLabel.text = String.welcomeMessage
        }
    }
}
