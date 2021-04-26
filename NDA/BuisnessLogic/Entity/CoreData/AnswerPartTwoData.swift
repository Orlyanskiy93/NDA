//
//  AnswerPartTwoData+CoreDataClass.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 24.04.2021.
//
//

import Foundation
import CoreData

@objc(AnswerPartTwoData)
public class AnswerPartTwoData: NSManagedObject {

}

extension AnswerPartTwoData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AnswerPartTwoData> {
        return NSFetchRequest<AnswerPartTwoData>(entityName: "AnswerPartTwoData")
    }

    @NSManaged public var question: String
    @NSManaged public var time: Date
    @NSManaged public var sessionData: SessionData
    @NSManaged public var optionData: OptionData?

}

extension AnswerPartTwoData : Identifiable {

}
