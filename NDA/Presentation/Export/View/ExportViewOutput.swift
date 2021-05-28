//
//  ExportExportViewOutput.swift
//  NDA
//
//  Created by Dmitriy on 07/05/2021.
//  Copyright © 2021 Personal. All rights reserved.
//
import Foundation

protocol ExportViewOutput {
    func viewIsReady()
    func getFileFolder() -> URL
}
