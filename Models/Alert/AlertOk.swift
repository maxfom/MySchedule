//
//  AlertOk.swift
//  MySchedule
//
//  Created by Максим Фомичев on 16.10.2021.
//

import UIKit

extension UIViewController {
    
    func alertOk(title: String, message: String?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(ok)

        present(alert, animated: true, completion: nil)
        
    }
}
