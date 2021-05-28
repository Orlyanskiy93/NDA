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
    @IBOutlet weak var exportNavigationItem: UINavigationItem!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var output: ExportViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        activityIndicator.hidesWhenStopped = true
    }

    func setupInitialState() {
        titleLabel.text = String.Export.exportTitle
        exportButton.setTitle(String.Button.export, for: .normal)
        exportNavigationItem.title = String.Export.export
    }
    
    @IBAction func export(_ sender: UIButton) {
        activityIndicator.startAnimating()
        DispatchQueue.main.async { [weak self] in
            let fileFolder = self?.output.getFileFolder()
            let vc = UIActivityViewController(activityItems: [fileFolder], applicationActivities: nil)
            self?.present(vc, animated: true, completion: nil)
            self?.activityIndicator.stopAnimating()
        }
    }
}
