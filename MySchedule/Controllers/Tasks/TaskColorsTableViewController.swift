//
//  ColorTaskTableViewController.swift
//  MySchedule
//
//  Created by Максим Фомичев on 12.10.2021.
//

import UIKit

class TaskColorsTableViewController: UITableViewController {
    
    private let idOptionColorTaskCell = "idOptionColorTaskCell"
    private let idOptionColorTaskHeader = "idOptionColorTaskHeader"
    
    let headerNameArray = ["RED", "ORANGE", "YELLOW", "GREEN", "BLUE", "DEEP BLUE", "PURPLE"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Colors Tasks"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        tableView.register(ColorsTableViewCell.self, forCellReuseIdentifier: idOptionColorTaskCell)
        tableView.separatorStyle = .none
        tableView.register(HeaderOptionsTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionColorTaskHeader)
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionColorTaskCell, for: indexPath) as! ColorsTableViewCell
        cell.cellConfigure(indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionColorTaskHeader) as! HeaderOptionsTableViewCell
        header.headerConfigure(nameArray: headerNameArray, section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0 : setColor(color: "4F0421")
        case 1 : setColor(color: "851C0D")
        case 2 : setColor(color: "B97A19")
        case 3 : setColor(color: "0E964C")
        case 4 : setColor(color: "2D7FC1")
        case 5 : setColor(color: "1F036C")
        case 6 : setColor(color: "8E5AF7")
        default:
            setColor(color: "FFFFFF")
        }
    }
    
    private func setColor(color: String) {
        let taskOptions = self.navigationController?.viewControllers[1] as? TaskOptionsTableViewController
        taskOptions?.hexColorCell = color
        taskOptions?.tableView.reloadRows(at: [[3, 0]], with: .fade)
        self.navigationController?.popViewController(animated: true)
    }
}
