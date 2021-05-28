//
//  ChartHeaderView.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 02.05.2021.
//

import UIKit

class ChartHeaderView: UITableViewHeaderFooterView {
    @IBOutlet weak var chartView: ChartView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func setup(with sessions: [Session]) {
        titleLabel.text = String.History.recentScores
        chartView.setData(with: sessions)
    }
}
