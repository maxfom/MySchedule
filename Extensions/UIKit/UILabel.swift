//
//  UILabel.swift
//  MySchedule
//
//  Created by Максим Фомичев on 30.09.2021.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont?, aligment: NSTextAlignment) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = .black
        self.adjustsFontForContentSizeCategory = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .red
        
    }
}
