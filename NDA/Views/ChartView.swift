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
    private var coordinates: [Coordinate] = []
    private let blueColor: UIColor = UIColor(named: "NDBlue") ?? .systemBlue
    
    override func awakeFromNib() {
        super.awakeFromNib()
        chartSetup()
    }
    
    func chartSetup() {
        self.rightAxis.enabled = false
        self.extraRightOffset = 20
        self.xAxis.labelPosition = .bottom
        self.xAxis.drawGridLinesEnabled = false
        self.leftAxis.drawGridLinesEnabled = false
        self.legend.form = .empty
    }
    
    func setupCoordinates(with sessions: [Session]) {
        var coordinates = [Coordinate]()
        for i in 0..<sessions.count {
            let xPoint = Double(i)
            let yPoint = sessions[i].score.average
            let coordinate = Coordinate(xPoint: xPoint, yPoint: yPoint)
            coordinates.append(coordinate)
        }
        self.coordinates = coordinates
    }
    
    func setData(with sessions: [Session]) {
        setupCoordinates(with: sessions)
        self.sessions = sessions
        self.xAxis.valueFormatter = self
    
        self.xAxis.calculate(min: 0, max: Double(coordinates.count))
        if coordinates.count == 1 {
            self.xAxis.setLabelCount(coordinates.count, force: false)
        } else {
            self.xAxis.setLabelCount(coordinates.count, force: true)
        }
        
        var values: [ChartDataEntry] = []
        
        coordinates.forEach { coordinate in
            let xPoint = coordinate.xPoint
            let yPoint = coordinate.yPoint
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
