//
//  ContactModel.swift
//  MySchedule
//
//  Created by Максим Фомичев on 20.10.2021.
//

import RealmSwift

class ContactModel: Object {
    
    @Persisted var contactName: String = "Unknown"
    @Persisted var contactPhone: String = "Unknown"
    @Persisted var contactMail: String = "Unknown"
    @Persisted var contactType: String = "Unknown"
    @Persisted var contactPhoto: Data?
}
