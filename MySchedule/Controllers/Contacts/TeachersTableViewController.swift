//
//  TeachersViewController.swift
//  MySchedule
//
//  Created by Максим Фомичев on 14.10.2021.
//

import UIKit
import RealmSwift

class TeachersTableViewController: UITableViewController {
    
    private let localRealm = try! Realm()
    private var contactsArray: Results<ContactModel>!
    private let teacherId = "teacherId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        title = "Teachers"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        tableView.separatorStyle = .singleLine
        tableView.register(ContactsTableViewCell.self, forCellReuseIdentifier: teacherId)
        tableView.separatorStyle = .none
        
        contactsArray = localRealm.objects(ContactModel.self).filter("contactType = 'Teacher'")
    
    }
    
    private func setTeacher(teacher: String) {
        let scheduleOptions = self.navigationController?.viewControllers[1] as? ScheduleOptionsTableViewController
        scheduleOptions?.scheduleModel.scheduleTeacher = teacher
        scheduleOptions?.cellNameArray[2][0] = teacher
        scheduleOptions?.tableView.reloadRows(at: [[2,0]], with: .none)
        self.navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contactsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: teacherId, for: indexPath) as! ContactsTableViewCell
        let model = contactsArray[indexPath.row]
        cell.configure(model: model)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = contactsArray[indexPath.row]
        setTeacher(teacher: model.contactName)
    }

}
