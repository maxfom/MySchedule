//
//  ScheduleTableViewCell.swift
//  MySchedule
//
//  Created by Максим Фомичев on 28.09.2021.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {
    
    let lessonName: UILabel = {
        let label = UILabel()
        label.text = "Программирование"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Demi Bold", size: 20)
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .red
        return label
    }()
    
    let teacherName: UILabel = {
        let label = UILabel()
        label.text = "Антонов Антон Батонович"
        label.textColor = .brown
        label.font = UIFont(name: "Avenir Next", size: 16)
        label.textAlignment = .right
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .red
        return label
    }()
    
    let lessonTime: UILabel = {
        let label = UILabel()
        label.text = "08.00"
        label.textColor = .darkGray
        label.font = UIFont(name: "Avenir Next Demi Bold", size: 18)
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .red
        return label
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.text = "Тип:"
        label.textColor = .darkGray
        label.font = UIFont(name: "Avenir Next", size: 14)
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .red
        return label
    }()
    
    let lessonType: UILabel = {
        let label = UILabel()
        label.text = "Практика"
        label.textColor = .darkGray
        label.font = UIFont(name: "Avenir Next Demi Bold", size: 14)
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .red
        return label
    }()
    
    let buildingLabel: UILabel = {
        let label = UILabel()
        label.text = "Где"
        label.textColor = .darkGray
        label.font = UIFont(name: "Avenir Next", size: 14)
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .red
        return label
    }()
    
    let lessonBuilding: UILabel = {
        let label = UILabel()
        label.text = "Дома"
        label.textColor = .darkGray
        label.font = UIFont(name: "Avenir Next Demi Bold", size: 14)
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .red
        return label
    }()
    
    let audLabel: UILabel = {
        let label = UILabel()
        label.text = "Аудитория"
        label.textColor = .darkGray
        label.font = UIFont(name: "Avenir Next", size: 14)
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .red
        return label
    }()
    
    let lessonAud: UILabel = {
        let label = UILabel()
        label.text = "300"
        label.textColor = .darkGray
        label.font = UIFont(name: "Avenir Next Demi Bold", size: 14)
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .red
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
//    override func layoutSubviews() {
//        setConstraints()
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        
        let topStackView = UIStackView(arrangedSubviews: [lessonName, teacherName], axis: .horizontal, spacing: 10, distribution: .fillEqually)
        
        let bottomStackView = UIStackView(arrangedSubviews: [typeLabel ,lessonType, buildingLabel, lessonBuilding, audLabel, lessonAud], axis: .horizontal, spacing: 10, distribution: .fillProportionally)
        
        
//        stackView.addArrangedSubview(lessonName)
//        stackView.addArrangedSubview(teacherName)
//        stackView.axis = .horizontal
//        stackView.spacing = 10
//        stackView.distribution = .fillEqually
//        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(topStackView)
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            topStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            topStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            topStackView.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        self.addSubview(bottomStackView)
        NSLayoutConstraint.activate([
            bottomStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            bottomStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            bottomStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            bottomStackView.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        self.addSubview(lessonTime)
        NSLayoutConstraint.activate([
            lessonTime.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            lessonTime.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            lessonTime.widthAnchor.constraint(equalToConstant: 100),
            lessonTime.heightAnchor.constraint(equalToConstant: 35)
        ])
        
//        self.addSubview(lessonName)
//        NSLayoutConstraint.activate([
//            lessonName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
//            lessonName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
//            lessonName.widthAnchor.constraint(equalToConstant: self.frame.width / 2 - 10),
//            lessonName.heightAnchor.constraint(equalToConstant: 35)
//        ])
//
//        self.addSubview(teacherName)
//        NSLayoutConstraint.activate([
//            teacherName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
//            teacherName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
//            teacherName.widthAnchor.constraint(equalToConstant: self.frame.width / 2 - 10),
//            teacherName.heightAnchor.constraint(equalToConstant: 35)
//        ])
        
    }
    
}
