//
//  PartTwoDetailsDisplayManager.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 18.04.2021.
//

import UIKit

class PartTwoDetailsDisplayManager: NSObject, UITableViewDelegate {
    var tableView: UITableView!
    var answers: [AnswerPartTwo] = []
    var session: Session! {
        didSet {
            answers = session.answersPartTwo
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
        tableView.register(PartTwoDetailsImageCell.nib, forCellReuseIdentifier: PartTwoDetailsImageCell.identifier)
        tableView.register(PartTwoDetailsTextCell.nib, forCellReuseIdentifier: PartTwoDetailsTextCell.identifier)
        tableView.register(PartTwoDetailsHeaderView.nib, forHeaderFooterViewReuseIdentifier: PartTwoDetailsHeaderView.identifier)
        tableView.delegate = self
        tableView.dataSource = self        
    }
    
}

extension PartTwoDetailsDisplayManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let answer = answers[indexPath.row]
        
        if answer.option.type == .image {
            let cell = tableView.dequeueReusableCell(withIdentifier: PartTwoDetailsImageCell.identifier) as! PartTwoDetailsImageCell
            cell.fill(with: answer)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PartTwoDetailsTextCell.identifier) as! PartTwoDetailsTextCell
            cell.fill(with: answer)
            return cell
        }
    }
    
    func setHeader() {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: PartTwoDetailsHeaderView.identifier) as! PartTwoDetailsHeaderView
        header.fill(with: session)
        tableView.tableHeaderView = header
    }
}
