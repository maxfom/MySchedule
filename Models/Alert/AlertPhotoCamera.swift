//
//  PhotoCameraAlert.swift
//  MySchedule
//
//  Created by Максим Фомичев on 15.10.2021.
//

import UIKit

extension UIViewController {
    func alertPhotoCamer(completionHandler: @escaping (UIImagePickerController.SourceType) -> Void) {
    
    let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Camera", style: .default) { _ in
            let camera = UIImagePickerController.SourceType.camera
            completionHandler(camera)
        }
        
        let photoLibrary = UIAlertAction(title: "Photo library", style: .default) { _ in
            let photoLibrary = UIImagePickerController.SourceType.photoLibrary
            completionHandler(photoLibrary)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(camera)
        alertController.addAction(photoLibrary)
        alertController.addAction(cancel)
        
        alertController.negativeWidthConstaint()

        
        present(alertController, animated: true)
    }
}
                              
