//
//  ScheduleModel.swift
//  MySchedule
//
//  Created by Максим Фомичев on 15.10.2021.
//

import RealmSwift

class ScheduleModel: Object {
    
    @Persisted var scheduleDate: Date?
    @Persisted var scheduleTime: Date?
    @Persisted var scheduleName: String = "Unknown name"
    @Persisted var scheduleType: String = "No type"
    @Persisted var scheduleBuilding: String = "--"
    @Persisted var scheduleAudience: String = "---"
    @Persisted var scheduleTeacher: String = "Name LastName"
    @Persisted var scheduleColor: String = "0E964C"
    @Persisted var scheduleRepeat: Bool = true
    @Persisted var scheduleWeekday: Int = 1
}
