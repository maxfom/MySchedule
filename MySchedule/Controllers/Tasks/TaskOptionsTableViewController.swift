//
//  TaskOptionTableView.swift
//  MySchedule
//
//  Created by Максим Фомичев on 12.10.2021.
//

import UIKit

class TaskOptionsTableViewController: UITableViewController {
    
    let idOptionTaskCell = "idOptionTaskCell"
    let idOptionTasksHeader = "idOptionTasksHeader"
    let headerNameArray = ["DATE AND TIME", "LESSON", "TEACHER", "COLOR"]
    
    let cellNameArray = ["Date", "Lesson", "Task", ""]
    
    var hexColorCell = "0E964C"
    
    private var taskModel = TaskModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Options Tasks"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: idOptionTaskCell)
        tableView.separatorStyle = .none
        tableView.register(HeaderOptionsTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionTasksHeader)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
        
    }
    
    @objc private func saveButtonTapped() {
        
        if taskModel.taskName == "Unknown name" || taskModel.taskDate == nil  {
            alertOk(title: "Error", message: "Required fields: Name, Description")
        } else {
        taskModel.taskColor = hexColorCell
        RealmManager.shared.saveTaskModel(model: taskModel)
        taskModel = TaskModel()
        alertOk(title: "Success", message: nil)
        hexColorCell = "0E964C"
        tableView.reloadData()
        }
    }


    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionTaskCell, for: indexPath) as! OptionsTableViewCell
        cell.cellTasksConfigure(nameArray: cellNameArray, indexPath: indexPath, hexColor: hexColorCell)
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
            self.taskModel.taskDate = date
        }
        case 1: alertForCellName(label: cell.nameCellLabel, name: "Name Task", placeholder: "Enter name of task") { text in
            self.taskModel.taskName = text
        }
        case 2: alertForCellName(label: cell.nameCellLabel, name: "Description Task", placeholder: "Enter description") { text in
            self.taskModel.taskDescription = text
        }
        case 3: pushControllers(vc: TaskColorsTableViewController())
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


