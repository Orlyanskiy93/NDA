//
//  AnswerPartTwoData+CoreDataProperties.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 22.04.2021.
//
//

import Foundation
import CoreData


extension AnswerPartTwoData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AnswerPartTwoData> {
        return NSFetchRequest<AnswerPartTwoData>(entityName: "AnswerPartTwoData")
    }

    @NSManaged public var question: String?
    @NSManaged public var time: Date?

}

extension AnswerPartTwoData : Identifiable {

}
