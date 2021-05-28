//
//  HeaderView.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 20.04.2021.
//

import UIKit

extension UITableViewHeaderFooterView {
    static var identifier: String {
        return String(describing: self)
    }

    static var nib: UINib {
        return UINib(nibName: self.identifier, bundle: .none)
    }
}

class PartOneDetailsHeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var partTitleLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var cannotCertainLabel: UILabel!
    @IBOutlet weak var moderatelyCertainLabel: UILabel!
    @IBOutlet weak var highlyCertainLabel: UILabel!
    
    func fill(with session: Session) {
        dateLabel.text = DateFormatter.stringForSession(session.completionDate)
        partTitleLabel.text = String.History.partOne
        scoreLabel.text = Int(session.score.partOne).description
        instructionsLabel.text = String.PartOne.instructions
        cannotCertainLabel.text = String.PartOne.cannotCertain
        moderatelyCertainLabel.text = String.PartOne.moderatelyCertain
        highlyCertainLabel.text = String.PartOne.highlyCertain
    }
}
