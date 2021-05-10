//
//  StatusView.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 02.05.2021.
//

import UIKit

class StatusView: RoundedView {
    private let lightGreyColor: UIColor = UIColor(named: "NDLightGrey") ?? .lightGray
    private let greenColor: UIColor = UIColor(named: "NDGreen") ?? .systemGreen
    private let redColor: UIColor = UIColor(named: "NDRed") ?? .systemRed

    private var statusLabel: UILabel = UILabel()
    private var state: State = .notDetermined {
        didSet {
            switch state {
            case .notDetermined:
                notDeterminedSetup()
            case .positiveDynamics:
                positiveDynamicsSetup()
            case .negativeDynamics:
                negativeDynamicsSetup()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addSubview(statusLabel)
        state = .notDetermined
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.numberOfLines = 0
        addConstraints()
    }
    
    private func addConstraints() {
        let constraints = [
            NSLayoutConstraint(item: statusLabel,
                               attribute: .bottom,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .bottom,
                               multiplier: 1,
                               constant: -20),
            NSLayoutConstraint(item: statusLabel,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .top,
                               multiplier: 1,
                               constant: 20),
            NSLayoutConstraint(item: statusLabel,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .leading,
                               multiplier: 1,
                               constant: 20),
            NSLayoutConstraint(item: statusLabel,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .trailing,
                               multiplier: 1,
                               constant: -20)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func updateState(with points: [(x: Double, y: Double)]) {
        let slope = lineOfBestFit(points: points)
        
        if points.count < 3 {
            state = .notDetermined
        } else {
            if slope < -0.15 {
                state = .negativeDynamics
            } else {
                state = .positiveDynamics
            }
        }
    }
    
    private func notDeterminedSetup() {
        statusLabel.text = String.Home.notDeterminedStatus
        self.layer.borderColor = lightGreyColor.cgColor
    }
    
    private func positiveDynamicsSetup() {
        statusLabel.text = String.Home.positiveDynamicsStatus
        self.layer.borderColor = greenColor.cgColor
    }
    
    private func negativeDynamicsSetup() {
        statusLabel.text = String.Home.negativeDynamicsStatus
        self.layer.borderColor = redColor.cgColor
    }
    
    private func lineOfBestFit(points: [(x: Double, y: Double)]) -> Double {

            var sumX: Double = 0
            for element in points {
                sumX += element.x
            }

            let meanX = sumX/Double(points.count)

            var sumY: Double = 0
            for element in points {
                sumY += element.y
            }

            let meanY = sumY/Double(points.count)

            var productXY: Double = 0
            for i in 0..<points.count {
                let left = points[i].x - meanX
                let right = points[i].y - meanY
                productXY += left * right
            }

            var productXX: Double = 0
            for i in 0..<points.count {
                let deviationFromMeanX = points[i].x - meanX
                productXX += deviationFromMeanX * deviationFromMeanX
            }

            let slope: Double = productXY/productXX
            return slope
        }
}

extension StatusView {
    enum State {
        case notDetermined
        case positiveDynamics
        case negativeDynamics
    }
}
