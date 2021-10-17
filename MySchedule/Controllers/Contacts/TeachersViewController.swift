//
//  TeachersViewController.swift
//  MySchedule
//
//  Created by Максим Фомичев on 14.10.2021.
//

import UIKit

class TeachersViewController: UITableViewController {
    
    let idContactsCell = "idContactsCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Teachers"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        tableView.separatorStyle = .singleLine
        tableView.register(ContactsTableViewCell.self, forCellReuseIdentifier: idContactsCell)
        tableView.separatorStyle = .none
    
    }

}
