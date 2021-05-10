//
//  NotificationsService.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 08.05.2021.
//

import Foundation

protocol NotificationsService {
    func sendNotification(from timeInterval: TimeInterval)
}
