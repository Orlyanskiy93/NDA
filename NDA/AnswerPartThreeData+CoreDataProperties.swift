//
//  AnswerPartThreeData+CoreDataProperties.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 22.04.2021.
//
//

import Foundation
import CoreData


extension AnswerPartThreeData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AnswerPartThreeData> {
        return NSFetchRequest<AnswerPartThreeData>(entityName: "AnswerPartThreeData")
    }

    @NSManaged public var gunningFogIndex: Double
    @NSManaged public var question: String?

}

extension AnswerPartThreeData : Identifiable {

}
