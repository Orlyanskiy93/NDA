//
//  SessionData+CoreDataClass.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 24.04.2021.
//
//

import Foundation
import CoreData

@objc(SessionData)
public class SessionData: NSManagedObject {

}

extension SessionData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SessionData> {
        return NSFetchRequest<SessionData>(entityName: "SessionData")
    }

    @NSManaged public var completionDate: Date?
    @NSManaged public var answersPartOneData: NSSet?
    @NSManaged public var answersPartTwoData: NSSet?
    @NSManaged public var answerPartThreeData: AnswerPartThreeData?

}

// MARK: Generated accessors for answersPartOneData
extension SessionData {

    @objc(addAnswersPartOneDataObject:)
    @NSManaged public func addToAnswersPartOneData(_ value: AnswerPartOneData)

    @objc(removeAnswersPartOneDataObject:)
    @NSManaged public func removeFromAnswersPartOneData(_ value: AnswerPartOneData)

    @objc(addAnswersPartOneData:)
    @NSManaged public func addToAnswersPartOneData(_ values: NSSet)

    @objc(removeAnswersPartOneData:)
    @NSManaged public func removeFromAnswersPartOneData(_ values: NSSet)

}

// MARK: Generated accessors for answersPartTwoData
extension SessionData {

    @objc(addAnswersPartTwoDataObject:)
    @NSManaged public func addToAnswersPartTwoData(_ value: AnswerPartTwoData)

    @objc(removeAnswersPartTwoDataObject:)
    @NSManaged public func removeFromAnswersPartTwoData(_ value: AnswerPartTwoData)

    @objc(addAnswersPartTwoData:)
    @NSManaged public func addToAnswersPartTwoData(_ values: NSSet)

    @objc(removeAnswersPartTwoData:)
    @NSManaged public func removeFromAnswersPartTwoData(_ values: NSSet)

}

extension SessionData : Identifiable {

}
