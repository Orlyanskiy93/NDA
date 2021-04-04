//
//  Strings.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 22.03.2021.
//

import Foundation

extension String {
    struct Error {
        static let error = "Error"
        static let ok = "Ok"
        static let wrongName = "Name must contains only letters"
        static let wrongAge = "Age is to much"
        static let wrongEmail = "Wrong email"
        static let emptyField = "Field is empty"
        static let saveUser = "Unable to save user"
        static let getUser = "Unable to load user"
    }
    
    struct Button {
        static let ok = "OK"
        static let `continue` = "CONTINUE"
        static let next = "NEXT"
        static let begin = "BEGIN"
        static let editInformation = "EDIT INFORMATION"
        static let eraceAppData = "ERACE APP DATA"
    }
    
    struct PartOne {
        static let moduleDescription = "The following questions are designed to help us get a better understanding of any symptoms you might be experiencing in the areas of attention, memory, organization and thinking. Please try to objective in your answers."
        static let instructions = "Using the scale provided, please rate how certain you are can do the following actions:"
        static let cannotCertain = "Cannot do at all"
        static let moderatelyCertain = "Moderately can do"
        static let highlyCertain = "Highly certain can do"
    }
}
