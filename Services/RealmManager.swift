//
//  RealmManager.swift
//  MySchedule
//
//  Created by Максим Фомичев on 15.10.2021.
//

import RealmSwift

class RealmManager {
    
    static let shared = RealmManager()
    
    private init() {}
    
    let localRealm = try! Realm()
    
    
    //ScheduleModel
    
    func saveScheduleModel(model: ScheduleModel) {
        try! localRealm.write {
            localRealm.add(model)
        }
    }
    
    func deleteScheduleModel(model: ScheduleModel) {
        try! localRealm.write {
            localRealm.delete(model)
        }
    }
    
    //Task Model
    
    func saveTaskModel(model: TaskModel) {
        try! localRealm.write {
            localRealm.add(model)
        }
    }
    
    func deleteTaskModel(model: TaskModel) {
        try! localRealm.write {
            localRealm.delete(model)
        }
    }
    
    func updateReadyButtonTaskModel(task: TaskModel, bool: Bool) {
        try! localRealm.write {
            task.taskReady = bool
        }
    }
    
    //Contact Model
    
    func saveContactModel(model: ContactModel) {
        try! localRealm.write {
            localRealm.add(model)
        }
    }

    func deleteContactModel(model: ContactModel) {
        try! localRealm.write {
            localRealm.delete(model)
        }
    }
    
}
