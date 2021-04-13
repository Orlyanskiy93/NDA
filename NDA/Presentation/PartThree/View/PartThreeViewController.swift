//
//  PartThreePartThreeViewController.swift
//  NDA
//
//  Created by Dmitriy on 06/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartThreeViewController: UIViewController, PartThreeViewInput {
    @IBOutlet weak var textView: UITextView!
    
    var output: PartThreeViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func setupInitialState() {
    }
    
    @IBAction func next(_ sender: RoundedButton) {
        let text = textView.text ?? ""
        output.recive(text)
    }
}