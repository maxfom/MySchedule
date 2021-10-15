//
//  TaskOptionTableView.swift
//  MySchedule
//
//  Created by Максим Фомичев on 12.10.2021.
//

import UIKit

class TaskOptionsTableView: UITableViewController {
    
    let idOptionTaskCell = "idOptionTaskCell"
    let idOptionTasksHeader = "idOptionTasksHeader"
    let headerNameArray = ["DATE AND TIME", "LESSON", "TEACHER", "COLOR"]
    
    let cellNameArray = ["Date", "Lesson", "Task", ""]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Options Tasks"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: idOptionTaskCell)
        tableView.separatorStyle = .none
        tableView.register(HeaderOptionsTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionTasksHeader)
        
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionTaskCell, for: indexPath) as! OptionsTableViewCell
        cell.cellTaskConfigure(nameArray: cellNameArray, indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionTasksHeader) as! HeaderOptionsTableViewCell
        header.headerConfigure(nameArray: headerNameArray, section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! OptionsTableViewCell
        
        switch indexPath.section {
        case 0: alertDate(label: cell.nameCellLabel) { (numberWeekDay, date) in
            print(numberWeekDay, date)
        }
        case 1: alertForCellName(label: cell.nameCellLabel, name: "Name Lesson", placeholder: "Enter name lesson")
        case 2: alertForCellName(label: cell.nameCellLabel, name: "Name Task", placeholder: "Enter name task")
        case 3: pushControllers(vc: ColorTaskTableViewController())
        default:
            print("Tap OptionsTableView")
        }
    }
    
    func pushControllers(vc: UIViewController) {
        let viewController = vc
        navigationController?.navigationBar.topItem?.title = "Options"
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}


