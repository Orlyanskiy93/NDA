//
//  PartOneDetailsDisplayManager.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 18.04.2021.
//

import UIKit

class PartOneDetailsDisplayManager: NSObject {
    var tableView: UITableView!
    var answers: [AnswerPartOne] = []
    var session: Session! {
        didSet {
            answers = session.answersPartOne.sorted(by: { answer1, answer2 in
                guard let firstCharacter = answer1.question.first,
                      let secondCharacter = answer2.question.first else {
                    return false
                }
                return firstCharacter < secondCharacter
            })
            setHeader()
            tableView.reloadData()
        }
    }
    
    init(_ tableView: UITableView) {
        self.tableView = tableView
        super.init()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.register(PartOneDetailsCell.nib, forCellReuseIdentifier: PartOneDetailsCell.identifier)
        tableView.register(PartOneDetailsHeaderView.nib, forHeaderFooterViewReuseIdentifier: PartOneDetailsHeaderView.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
}

extension PartOneDetailsDisplayManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return session.answersPartOne.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PartOneDetailsCell.identifier) as! PartOneDetailsCell
        let answer = answers[indexPath.row]
        cell.fill(with: answer)
        return cell
    }
}

extension PartOneDetailsDisplayManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func setHeader() {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: PartOneDetailsHeaderView.identifier) as! PartOneDetailsHeaderView
        header.fill(with: session)
        tableView.tableHeaderView = header
    }
}
