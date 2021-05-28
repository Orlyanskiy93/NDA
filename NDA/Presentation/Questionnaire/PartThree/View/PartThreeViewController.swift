//
//  PartThreePartThreeViewController.swift
//  NDA
//
//  Created by Dmitriy on 06/04/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit
import KMPlaceholderTextView

class PartThreeViewController: UIViewController, PartThreeViewInput {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var nextButton: RoundedButton!
    @IBOutlet weak var buttonsStackVIew: ButtonsStackView!
    
    var output: PartThreeViewOutput!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func setupInitialState() {
        hideKeyboardWhenTaped()
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        navigationController?.navigationBar.isHidden = true
        nextButton.setTitle(String.Button.next, for: .normal)
        buttonsStackVIew.createButtons(count: 1)
    }
    
    func fill(with question: QuestionPartThree) {
        questionLabel.text = question
    }
    
    @IBAction func next(_ sender: RoundedButton) {
        let text = textView.text ?? ""
        output.didRecived(text)
    }
}
