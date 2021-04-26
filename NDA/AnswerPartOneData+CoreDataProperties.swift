//
//  AnswerPartOneData+CoreDataProperties.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 22.04.2021.
//
//

import Foundation
import CoreData


extension AnswerPartOneData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AnswerPartOneData> {
        return NSFetchRequest<AnswerPartOneData>(entityName: "AnswerPartOneData")
    }

    @NSManaged public var question: String?
    @NSManaged public var value: Int32

}

extension AnswerPartOneData : Identifiable {

}
