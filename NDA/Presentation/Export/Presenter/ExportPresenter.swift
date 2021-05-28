//
//  ExportExportPresenter.swift
//  NDA
//
//  Created by Dmitriy on 07/05/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import Foundation
import CSV

class ExportPresenter: NSObject, ExportModuleInput, ExportViewOutput, ExportInteractorOutput {

    weak var view: ExportViewInput!
    var interactor: ExportInteractorInput!
    var router: ExportRouterInput!
    var sessions: [Session] = []

    func viewIsReady() {
        sessions = interactor.loadSessions()
        view.setupInitialState()
    }
    
    func getFileFolder() -> URL {
        var fileUrl: URL = URL(fileURLWithPath: "")
        do {
            let fileManager = FileManager.default
            let path = try fileManager.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
            fileUrl = path.appendingPathComponent("SessionsResults.csv")
            
            guard let stream = OutputStream(toFileAtPath: fileUrl.path, append: false) else {
                throw CSVError.cannotWriteStream
            }

            let csv = try CSVWriter(stream: stream)
            try csv.write(row: String.Export.tableTitlesStrings)
            try sessions.forEach { session in
                try csv.write(row: session.stringsForCSV)
            }
        } catch {
            view.show(error)
        }
        return fileUrl
    }
}
