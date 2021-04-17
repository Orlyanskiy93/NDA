//
//  HistoryCell.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 17.04.2021.
//

import UIKit

class HistoryCell: UITableViewCell {
    static let identifier: String = "HistoryCell"
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreValueLabel: UILabel!
    
    func fill(with session: Session) {
        guard let score = try? session.getScore() else {
            return
        }
        dateLabel.text = session.completionDate.description
        scoreLabel.text = String.History.score
        scoreValueLabel.text = score.average.description
    }
    
}
