//
//  ScheduleTableViewCell.swift
//  MySchedule
//
//  Created by Максим Фомичев on 28.09.2021.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {

    
    let lessonName = UILabel(text: "", font: .AvenirNextDemiBold18())
    let teacherName = UILabel(text: "Fomichev Maxim Eduardovich", font: .AvenirNextDemiBold14(), aligment: .right)
    let lessonTime = UILabel(text: "", font: .AvenirNextDemiBold16())
    let typeLabel = UILabel(text: "Type:", font: .AvenirNext14(), aligment: .right)
    let lessonType = UILabel(text: "", font: .AvenirNextDemiBold14())
    let buildingLabel = UILabel(text: "Building", font: .AvenirNext14(), aligment: .right)
    let lessonBuilding = UILabel(text: "", font: .AvenirNextDemiBold14())
    let audLabel = UILabel(text: "Audience", font: .AvenirNext14(), aligment: .right)
    let lessonAud = UILabel(text: "", font: .AvenirNextDemiBold12(), aligment: .right)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: ScheduleModel) {
        let df = DateFormatter()
        df.dateFormat = "HH:mm"
        lessonName.text = model.scheduleName
        teacherName.text = model.scheduleTeacher
        guard let time = model.scheduleTime else { return }
        lessonTime.text = df.string(from: time)
        lessonType.text = model.scheduleType
        lessonBuilding.text = model.scheduleBuilding
        lessonAud.text = model.scheduleAudience
        
        backgroundColor = UIColor().colorFromHex("\(model.scheduleColor)")
    }
    
    func setConstraints() {
        
        let topStackView = UIStackView(arrangedSubviews: [lessonName, teacherName], axis: .horizontal, spacing: 10, distribution: .fillEqually)
        
        self.addSubview(topStackView)
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            topStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            topStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            topStackView.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        self.addSubview(lessonTime)
        NSLayoutConstraint.activate([
            lessonTime.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            lessonTime.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            lessonTime.widthAnchor.constraint(equalToConstant: 80),
            lessonTime.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        let bottomStackView = UIStackView(arrangedSubviews: [typeLabel ,lessonType, buildingLabel, lessonBuilding,  audLabel, lessonAud], axis: .horizontal, spacing: 5, distribution: .fillProportionally)
        
        self.addSubview(bottomStackView)
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            bottomStackView.leadingAnchor.constraint(equalTo: lessonTime.trailingAnchor, constant: 5),
            bottomStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            bottomStackView.heightAnchor.constraint(equalToConstant: 35)
        ])
        
    }
    
}
