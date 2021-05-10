//
//  PartTwoDetailsHeaderView.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 21.04.2021.
//

import UIKit

class PartTwoDetailsHeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var partTitleLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupFromNib()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setupFromNib()
//    }
    
    func fill(with session: Session) {
        dateLabel.text = DateFormatter.stringForSession(session.completionDate)
        partTitleLabel.text = String.History.partTwo
        scoreLabel.text = Int(session.score.partTwo).description
    }
}
