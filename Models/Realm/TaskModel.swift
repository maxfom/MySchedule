//
//  TaskModel.swift
//  MySchedule
//
//  Created by Максим Фомичев on 19.10.2021.
//

import RealmSwift

class TaskModel: Object {
    
    @Persisted var taskDate: Date?
    @Persisted var taskName: String = "Unknown name"
    @Persisted var taskDescription: String = "No description"
    @Persisted var taskColor: String = "0E964C"
    @Persisted var taskReady: Bool = false
}
