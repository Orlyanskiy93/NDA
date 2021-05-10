//
//  ExportExportViewController.swift
//  NDA
//
//  Created by Dmitriy on 07/05/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class ExportViewController: UIViewController, ExportViewInput {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var exportButton: RoundedButton!
    
    var output: ExportViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func setupInitialState() {
        titleLabel.text = String.Export.exportTitle
        exportButton.setTitle(String.Button.export, for: .normal)
    }
    
    @IBAction func export(_ sender: UIButton) {
    }
}
