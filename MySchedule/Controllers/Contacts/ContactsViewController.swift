//
//  ContactsTableViewController.swift
//  MySchedule
//
//  Created by Максим Фомичев on 12.10.2021.
//

import UIKit
import RealmSwift

class ContactsViewController: UIViewController {
    
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Friends", "Teachers"])
        return segmentedControl
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        tableView.separatorStyle = .singleLine
        return tableView
    }()
    
    let searchController = UISearchController()
    
    let idContactsCell = "idContactsCell"
    
    private let localRealm = try! Realm()
    private var contactsArray: Results<ContactModel>!
    private var filteredArray: Results<ContactModel>!
    
    var searchBarIsEmpty: Bool {
        guard  let text = searchController.searchBar.text else { return true }
        return text.isEmpty
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Contacts"
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        tableView.separatorStyle = .singleLine
        tableView.register(ContactsTableViewCell.self, forCellReuseIdentifier: idContactsCell)
        tableView.separatorStyle = .none
        
        contactsArray = localRealm.objects(ContactModel.self).filter("contactType = 'Friend'")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        
        searchController.searchBar.placeholder = "Search.."
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        
        setConstraints()
        
        segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        
    }
    
    @objc private func segmentChanged() {
        if segmentedControl.selectedSegmentIndex == 0 {
            contactsArray = localRealm.objects(ContactModel.self).filter("contactType = 'Friend'")
            tableView.reloadData()
        } else {
            contactsArray = localRealm.objects(ContactModel.self).filter("contactType = 'Teacher'")
            tableView.reloadData()
        }
    }
    
    @objc func addButtonTapped() {
        let contactOption = ContactsOptionsTableViewController()
        navigationController?.pushViewController(contactOption, animated: true)
    }
    
    
    func pushControllers(vc: UIViewController) {
        let viewController = vc
        navigationController?.navigationBar.topItem?.title = "Options"
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

//MARK: UITableViewDelegate, UITableViewDataSource

extension ContactsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (isFiltering ? filteredArray.count : contactsArray.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idContactsCell, for: indexPath) as! ContactsTableViewCell
        let model = (isFiltering ? filteredArray[indexPath.row] : contactsArray[indexPath.row])
        cell.configure(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tap contacts")
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let editingRow = contactsArray[indexPath.row]
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, completionHandler in
            RealmManager.shared.deleteContactModel(model: editingRow)
            tableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

extension ContactsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        filteredArray = contactsArray.filter("contactName CONTAINS[c] %@", searchText)
        tableView.reloadData()
    }
    
    
}

extension ContactsViewController {
    private func setConstraints() {
        
        let stackView = UIStackView(arrangedSubviews: [segmentedControl, tableView], axis: .vertical, spacing: 0, distribution: .equalSpacing)
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            
        ])
    }
}
