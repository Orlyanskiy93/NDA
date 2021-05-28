//
//  AnswerPartThreeData+CoreDataClass.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 24.04.2021.
//
//

import Foundation
import CoreData

@objc(AnswerPartThreeData)
public class AnswerPartThreeData: NSManagedObject {

}

extension AnswerPartThreeData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AnswerPartThreeData> {
        return NSFetchRequest<AnswerPartThreeData>(entityName: "AnswerPartThreeData")
    }

    @NSManaged public var gunningFogIndex: Double
    @NSManaged public var question: String
    @NSManaged public var answer: String
    @NSManaged public var sessionData: SessionData?

}

extension AnswerPartThreeData : Identifiable {

}
