//
//  AnswerPartOneData+CoreDataClass.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 24.04.2021.
//
//

import Foundation
import CoreData

@objc(AnswerPartOneData)
public class AnswerPartOneData: NSManagedObject {

}

extension AnswerPartOneData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AnswerPartOneData> {
        return NSFetchRequest<AnswerPartOneData>(entityName: "AnswerPartOneData")
    }

    @NSManaged public var question: String
    @NSManaged public var value: Int32
    @NSManaged public var sessionData: SessionData?

}

extension AnswerPartOneData : Identifiable {

}
