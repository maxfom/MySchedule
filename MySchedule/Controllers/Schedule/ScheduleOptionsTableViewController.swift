//
//  OptionsScheduleViewController.swift
//  MySchedule
//
//  Created by Максим Фомичев on 01.10.2021.
//

import UIKit

class ScheduleOptionsTableViewController: UITableViewController {
    
    private let idOptionScheduleCell = "idOptionScheduleCell"
    private let idOptionScheduleHeader = "idOptionScheduleHeader"
    
    let headerNameArray = ["DATE AND TIME", "LESSON", "TEACHER", "COLOR", "PERIOD"]
    
    var cellNameArray = [["Date", "Time"],
                         ["Name", "Type", "Building", "Audience"],
                         ["Teacher name"],
                         [""],
                         ["Repeat every 7 days"]]
    
    var scheduleModel = ScheduleModel()
    
    var hexColorCell: String = "0E964C"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Options Schedule"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: idOptionScheduleCell)
        tableView.separatorStyle = .none
        tableView.register(HeaderOptionsTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionScheduleHeader)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
    }
    
    @objc private func saveButtonTapped() {
        
        if scheduleModel.scheduleDate == nil || scheduleModel.scheduleTime == nil || scheduleModel.scheduleName == "Unknown name" {
            alertOk(title: "Error", message: "Required fields: Date, Time, Name")
        } else {
        
        scheduleModel.scheduleColor = hexColorCell
        RealmManager.shared.saveScheduleModel(model: scheduleModel)
        scheduleModel = ScheduleModel()
            alertOk(title: "Success", message: nil)
        hexColorCell = "0E964C"
        cellNameArray[2][0] = "Teacher name"
        tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 4
        case 2:
            return 1
        case 3:
            return 1
        default:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionScheduleCell, for: indexPath) as! OptionsTableViewCell
        cell.cellScheduleConfigure(nameArray: cellNameArray, indexPath: indexPath, hexColor: hexColorCell)
        cell.switchRepeatDelegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionScheduleHeader) as! HeaderOptionsTableViewCell
        header.headerConfigure(nameArray: headerNameArray, section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! OptionsTableViewCell
        switch indexPath {
        case [0, 0]:
            alertDate(label: cell.nameCellLabel) { (numberWeekDay, date) in
                self.scheduleModel.scheduleDate = date
                self.scheduleModel.scheduleWeekday = numberWeekDay
            }
        case [0, 1]:
            alertTime(label: cell.nameCellLabel) { time in
                self.scheduleModel.scheduleTime = time
            }
        case [1, 0]:
            alertForCellName(label: cell.nameCellLabel, name: "Name Lesson", placeholder: "Enter name lesson") { text in
                self.scheduleModel.scheduleName = text
            }
        case [1, 1]:
            alertForCellName(label: cell.nameCellLabel, name: "Type lesson", placeholder: "Enter type lesson") { text in
                self.scheduleModel.scheduleType = text
            }
        case [1, 2]:
            alertForCellName(label: cell.nameCellLabel, name: "Building number", placeholder: "Enter  number of building") { text in
                self.scheduleModel.scheduleBuilding = text
            }
        case [1, 3]:
            alertForCellName(label: cell.nameCellLabel, name: "Audience", placeholder: "Enter number of audience") { text in
                self.scheduleModel.scheduleAudience = text
            }
        case [2, 0]:
            pushControllers(vc: TeachersTableViewController()) 
        case [3, 0]:
            pushControllers(vc: ScheduleColorsViewController())
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

extension ScheduleOptionsTableViewController: SwtchRepeatProtocol {
    func switchRepeat(value: Bool) {
        self.scheduleModel.scheduleRepeat = value
    }
    
    
}
