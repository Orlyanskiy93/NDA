//
//  PartThreePartThreeViewController.swift
//  NDA
//
//  Created by Dmitriy on 06/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PartThreeViewController: UIViewController, PartThreeViewInput {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    var output: PartThreeViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func setupInitialState() {
        
    }
    
    func fill(with question: QuestionPartThree) {
        questionLabel.text = question
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func next(_ sender: RoundedButton) {
        let text = textView.text ?? ""
        output.didRecived(text)
    }
}
