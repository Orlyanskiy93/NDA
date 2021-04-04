//
//  testVC.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 01.04.2021.
//

import UIKit

class TestVC: UIViewController, SelectableImageDelegate {
    @IBOutlet var images: [SelectableImage]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        images[0].delegate = self
        images[1].delegate = self
        images[2].delegate = self
        images[3].delegate = self
    }
    
    func imageDidSelected(_ selectableImage: SelectableImage, with condition: SelectableImage.Condition) {
        if condition == .selected {
            images.forEach { (image) in
                image.notSelectedColorSetup()
                image.isSelected = false
            }
            selectableImage.selectedColorSetup()
            selectableImage.isSelected = true
        }
        if condition == .notSelected {
            images.forEach { (image) in
                image.baseColorSetup()
            }
            selectableImage.isSelected = false
        }
        
    }
}
