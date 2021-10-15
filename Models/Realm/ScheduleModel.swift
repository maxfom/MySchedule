//
//  ScheduleModel.swift
//  MySchedule
//
//  Created by Максим Фомичев on 15.10.2021.
//

import RealmSwift

class ScheduleModel: Object {
    
    @Persisted var scheduleDate = Date()
    @Persisted var scheduleTime = Date()
    @Persisted var scheduleName: String = ""
    @Persisted var scheduleType: String = ""
    @Persisted var scheduleBuilding: String = ""
    @Persisted var scheduleAudience: String = ""
    @Persisted var scheduleTeacher: String = ""
    @Persisted var scheduleColor: String = ""
    @Persisted var scheduleRepeat: Bool = true
    @Persisted var scheduleWeekday: Int = 1
}
