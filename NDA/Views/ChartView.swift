//
//  LineChartView.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 02.05.2021.
//

import UIKit
import Charts

class ChartView: LineChartView {
    private var sessions: [Session] = []
    private var coordinates: [(x: Double, y: Double)] = Coordinates().points
    private let blueColor: UIColor = UIColor(named: "NDBlue") ?? .systemBlue
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.rightAxis.enabled = false
        self.extraRightOffset = 20
        self.xAxis.labelPosition = .bottom
        self.xAxis.drawGridLinesEnabled = false
        self.leftAxis.drawGridLinesEnabled = false
        self.legend.form = .empty
    }
    
    func setData(with sessions: [Session]) {
        self.sessions = sessions
        self.xAxis.valueFormatter = self
    
        self.xAxis.calculate(min: 0, max: Double(coordinates.count))
        self.xAxis.setLabelCount(coordinates.count, force: true)
        
        var values: [ChartDataEntry] = []
        
        coordinates.forEach { (xPoint: Double, yPoint: Double) in
            let dataPoint = stringForValue(xPoint, axis: nil)
            let chartDataEntry = ChartDataEntry(x: xPoint, y: yPoint, data: dataPoint as AnyObject)
            values.append(chartDataEntry)
        }

        let set = LineChartDataSet(entries: values, label: nil)
        set.lineWidth = 5
        set.setColor(blueColor)
        set.setCircleColor(blueColor)
        
        let data = LineChartData(dataSet: set)
        data.setDrawValues(false)
        self.data = data
    }
}

extension ChartView: IAxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let index = Int(value)
        
        if index < 0 || index >= sessions.count {
            return ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d"
        let date = sessions[index].completionDate

        return dateFormatter.string(from: date)
    }
}
