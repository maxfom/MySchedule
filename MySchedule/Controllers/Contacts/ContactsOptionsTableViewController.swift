//
//  ContactOptionTableViewController.swift
//  MySchedule
//
//  Created by Максим Фомичев on 14.10.2021.
//

import UIKit

class ContactsOptionsTableViewController: UITableViewController {
    
    private let idOptionContactCell = "idOptionContactCell"
    private let idOptionContactHeader = "idOptionContactHeader"
    
    private let headerNameArray = ["NAME", "PHONE", "MAIL", "TYPE", "CHOOSE IMAGE"]
    
    private let cellNameArray = ["Name", "Phone", "Mail", "Type",  ""]
    
    private var imageIsChanged = false
    private var contactModel = ContactModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Options Contacts"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: idOptionContactCell)
        tableView.separatorStyle = .none
        tableView.register(HeaderOptionsTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionContactHeader)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
        
        
    }
    
    @objc private func saveButtonTapped() {
        
        if contactModel.contactName == "Unknown" || contactModel.contactType == "Unknown"  {
            alertOk(title: "Error", message: "Required fields: Name, Type")
        } else {
            setImageModel()
            
            RealmManager.shared.saveContactModel(model: contactModel)
            contactModel = ContactModel()
            
            alertOk(title: "Success", message: nil)
            tableView.reloadData()
        }
        
    }
    
    @objc private func setImageModel() {
        
        if imageIsChanged {
            let cell = tableView.cellForRow(at: [4, 0]) as! OptionsTableViewCell
            
            let image = cell.backgroundViewCell.image
            guard  let imageData = image?.pngData() else { return }
            contactModel.contactPhoto = imageData
            
            cell.backgroundViewCell.contentMode = .scaleAspectFit
            imageIsChanged = false
        } else {
            contactModel.contactPhoto = nil
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionContactCell, for: indexPath) as! OptionsTableViewCell
        cell.cellContactsConfigure(nameArray: cellNameArray, indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.section == 4 ? 200 : 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionContactHeader) as! HeaderOptionsTableViewCell
        header.headerConfigure(nameArray: headerNameArray, section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! OptionsTableViewCell
        
        switch indexPath.section {
        case 0:
            alertForCellName(label: cell.nameCellLabel, name: "Name contact", placeholder: "Enter name contact") { text in
                self.contactModel.contactName = text
            }
        case 1:
            alertForCellName(label: cell.nameCellLabel, name: "Phone Contact", placeholder: "Enter phone contact") { text in
                self.contactModel.contactPhone = text
            }
        case 2:
            alertForCellName(label: cell.nameCellLabel, name: "Mail Contact", placeholder: "Enter mail contact") { text in
                self.contactModel.contactMail = text
            }
        case 3:
            alertFrinedOrTeacher(label: cell.nameCellLabel) { type in
                self.contactModel.contactType = type
                
            }
        case 4:
            alertPhotoCamer { [self] source in
                chooseImagePicker(source: source)
            }
        default:
            print("contact click")
        }
    }
    
    func pushControllers(vc: UIViewController) {
        let viewController = vc
        navigationController?.navigationBar.topItem?.title = "Options"
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension ContactsOptionsTableViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let cell = tableView.cellForRow(at: [4, 0]) as! OptionsTableViewCell
        
        cell.backgroundViewCell.image = info[.editedImage] as? UIImage
        cell.backgroundViewCell.contentMode = .scaleAspectFill
        cell.backgroundViewCell.clipsToBounds = true
        imageIsChanged = true
        dismiss(animated: true)
    }
}


