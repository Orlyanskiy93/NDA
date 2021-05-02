//
//  LineChartView.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 02.05.2021.
//

import UIKit
import Charts

class ChartView: LineChartView {
    
    override func awakeFromNib() {
        self.rightAxis.enabled = false
        self.xAxis.labelPosition = .bottom
    }
    
    func setData(with sessions: [Session]) {
        self.xAxis.calculate(min: 0, max: Double(sessions.count))
        var values: [ChartDataEntry] = []
        for index in 0..<sessions.count {
            let xValue = index
            let yValue = sessions[index].score.average
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d"
            let dataPoint = dateFormatter.string(from: sessions[index].completionDate).uppercased()
            
            let chartDataEntry = ChartDataEntry(x: Double(xValue), y: yValue, data: dataPoint as AnyObject)
            values.append(chartDataEntry)
        }

        let set = LineChartDataSet(entries: values, label: nil)
        set.lineWidth = 5
        set.setColor(.systemBlue)
        set.setCircleColor(.systemBlue)
        
        let data = LineChartData(dataSet: set)
        data.setDrawValues(false)
        self.data = data
    }
}
