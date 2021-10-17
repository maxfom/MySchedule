//
//  PressButtonProtocols.swift
//  MySchedule
//
//  Created by Максим Фомичев on 01.10.2021.
//

import Foundation

protocol PressReadyTaskButtonProtocol: AnyObject {
    func readyButtonTapped(indexPath: IndexPath)
}

protocol SwtchRepeatProtocol {
    func switchRepeat(value: Bool)
}
