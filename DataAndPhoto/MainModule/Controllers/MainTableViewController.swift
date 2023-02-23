//
//  MainViewController.swift
//  DataAndPhoto
//
//  Created by Denis Kalugin on 18.02.2023.
//

import UIKit

final class MainTableViewController: UITableViewController {
    
    private var userModel = UserModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        getUserModel()
        tableView.register(MainTableViewCell.self) 
    }
    
    private func setupViews() {
        title = "Просмотр"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Редактировать",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(editingTapped))
    }
    
    @objc private func editingTapped() {
        let editingTableViewController = EditingViewController(userModel)
        navigationController?.pushViewController(editingTableViewController, animated: true)
    }
    
    private func getUserModel() {
        userModel = UserDefaultsManager.getUserModel()
    }
    
    private func saveEditModel(_ model: UserModel) {
        UserDefaultsManager.saveUserValue(Resources.NameFields.firstName.rawValue, model.firstName)
        UserDefaultsManager.saveUserValue(Resources.NameFields.secondName.rawValue, model.secondName)
        UserDefaultsManager.saveUserValue(Resources.NameFields.thirdName.rawValue, model.thirdName)
        UserDefaultsManager.saveUserValue(Resources.NameFields.birthsday.rawValue, model.birthsday)
        UserDefaultsManager.saveUserValue(Resources.NameFields.gender.rawValue, model.gender)
    }
    
    public func changeUserModel(model: UserModel) {
        saveEditModel(model)
        
        userModel = model
        tableView.reloadData()
       
    }
}

//MARK: - UITableViewDataSource

extension MainTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Resources.NameFields.allCases.count
    }
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(MainTableViewCell.self) else {
               return UITableViewCell()
           }
            
            let nameFiled = Resources.NameFields.allCases[indexPath.row].rawValue
            let value = UserDefaultsManager.getUserValue(Resources.NameFields.allCases[indexPath.row].rawValue)
            cell.configure(name: nameFiled, value: value)
            return cell
        }
    }

//MARK: - UITableViewDelegate
extension MainTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}

