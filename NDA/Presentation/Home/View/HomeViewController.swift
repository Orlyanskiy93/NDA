//
//  HomeHomeViewController.swift
//  NDA
//
//  Created by Dmitriy on 25/03/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, HomeViewInput {
    @IBOutlet weak var beginQuestionnaireButton: RoundedButton!
    @IBOutlet weak var statusView: StatusView!
    var output: HomeViewOutput!
    let blueColor: UIColor = UIColor(named: "NDBlue") ?? .systemBlue
    let greenColor: UIColor = UIColor(named: "NDGreen") ?? .systemGreen
    let grayColor: UIColor = UIColor(named: "NDGray") ?? .systemGray

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewIsReady()
        statusView.updateState(with: Coordinates().points)
    }
    
    func setup(with session: Session) {
        self.navigationItem.title = String.Home.home
        if session.stage != .partOne {
            setButton(title: String.Button.resumeQuestionnaire, color: greenColor, isEnabled: true)
        } else {
            setButton(title: String.Button.beginQuestionnaire, color: blueColor, isEnabled: true)
        }
    }
    
    @IBAction func begin(_ sender: UIButton) {
        output.runSession()
    }
    
    func setButton(title: String, color: UIColor, isEnabled: Bool) {
        beginQuestionnaireButton.setTitle(title, for: .normal)
        beginQuestionnaireButton.backgroundColor = color
        beginQuestionnaireButton.isEnabled = isEnabled
        
    }
    
    func updateButton(with timeInterval: TimeInterval) {
        if timeInterval < 1 {
            setButton(title: String.Button.beginQuestionnaire, color: blueColor, isEnabled: true)
            return
        }
        
        if timeInterval < timeInterval.minute {
            setButton(title: "\(Int(timeInterval)) " + String.Button.secondsToNextSession, color: grayColor, isEnabled: false)
            return
        }
        
        if timeInterval < timeInterval.hour {
            let minutes = Int(timeInterval / timeInterval.minute)
            setButton(title: "\(minutes) " + String.Button.minutesToNextSession, color: grayColor, isEnabled: false)
            return
        }
        
        if timeInterval < timeInterval.day {
            let hours = Int(timeInterval / timeInterval.hour)
            setButton(title: "\(hours) " + String.Button.hoursToNextSession , color: grayColor, isEnabled: false)
            return
        }
        
        if timeInterval < timeInterval.month {
            let days = Int(timeInterval / timeInterval.day)
            setButton(title: "\(days) " + String.Button.daysToNextSession, color: grayColor, isEnabled: false)
            return
        }
    }
    
    @IBAction func unwindToHome(_ sender: UIStoryboardSegue) {
        
    }
}
