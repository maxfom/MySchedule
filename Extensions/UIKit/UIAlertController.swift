//
//  UIAlertController.swift
//  MySchedule
//
//  Created by Максим Фомичев on 04.10.2021.
//

import UIKit

extension UIAlertController {
    
    func negativeWidthConstaint() {
        for subView in self.view.subviews {
            for constraints in subView.constraints where constraints.debugDescription.contains("width == -16") {
                subView.removeConstraint(constraints)
            }
        }
    }
}
