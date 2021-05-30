//
//  InformationDisplayManager.swift
//  NDA
//
//  Created by Дмитрий Орлянский on 09.05.2021.
//
import UIKit

class InformationDisplayManager: NSObject {
    var tableView: UITableView!
    var faqArray: [FAQ] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    init(_ tableView: UITableView) {
        self.tableView = tableView
        super.init()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.register(InformationCell.nib, forCellReuseIdentifier: InformationCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
        
}

extension InformationDisplayManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return faqArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InformationCell.identifier) as! InformationCell
        let faq = faqArray[indexPath.row]
        cell.fill(with: faq)
        return cell
    }
}

extension InformationDisplayManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? InformationCell else {
            return
        }
        tableView.beginUpdates()
        cell.isChosen = !cell.isChosen
        tableView.endUpdates()
    }
}
