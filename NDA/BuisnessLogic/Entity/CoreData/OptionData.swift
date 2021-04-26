//
//  OptionData+CoreDataClass.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 24.04.2021.
//
//

import Foundation
import CoreData

@objc(OptionData)
public class OptionData: NSManagedObject {

}

extension OptionData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OptionData> {
        return NSFetchRequest<OptionData>(entityName: "OptionData")
    }

    @NSManaged public var isRight: Bool
    @NSManaged public var type: String
    @NSManaged public var value: String
    @NSManaged public var answerPartTwoData: AnswerPartTwoData?

}

extension OptionData : Identifiable {

}
