//
//  EditingTableView.swift
//  DataAndPhoto
//
//  Created by Denis Kalugin on 22.02.2023.
//

import UIKit

final class EditingTableView: UITableView {
    
    private var userModel = UserModel()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
  
        register(TextViewTableViewCell.self)
        register(DatePickerTableViewCell.self)
        register(PickerTableViewCell.self)
        
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setUserModel(_ model: UserModel) {
        userModel = model
    }
    
    public func editUserModel() {
        guard let firstNameCell = self.cellForRow(at: [0,0]) as? TextViewTableViewCell,
               let secondNameCell = self.cellForRow(at: [0,1]) as? TextViewTableViewCell,
               let thirdNameCell = self.cellForRow(at: [0,2]) as? TextViewTableViewCell,
               let birthsdayCell = self.cellForRow(at: [0,3]) as? DatePickerTableViewCell,
               let genderCell = self.cellForRow(at: [0,4]) as? PickerTableViewCell else {
            return
        }
        userModel.firstName = firstNameCell.getCellValue()
        userModel.secondName = secondNameCell.getCellValue()
        userModel.thirdName = thirdNameCell.getCellValue()
        userModel.birthsday = birthsdayCell.getCellValue()
        userModel.gender = genderCell.getCellValue()
    }
    
    public func getUserModel() -> UserModel {
        editUserModel()
        return userModel
    }
}
//MARK: - UITableViewDataSource

extension EditingTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Resources.NameFields.allCases.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let nameFiled = Resources.NameFields.allCases[indexPath.row].rawValue
        
        switch indexPath.row {
        case 0...2:
            guard let cell = self.dequeueReusableCell(TextViewTableViewCell.self) else {
                return UITableViewCell()
            }
            
            cell.nameTextViewDelegate = self
            
            switch indexPath.row {
            case 0:cell.configure(name: nameFiled, scrollEnable: true, value: userModel.firstName)
            case 1:cell.configure(name: nameFiled, scrollEnable: false, value: userModel.secondName)
            default:
                cell.configure(name: nameFiled, scrollEnable: true, value: userModel.thirdName)
            }
            return cell
        case 3:
            guard let cell = self.dequeueReusableCell(DatePickerTableViewCell.self) else {
                return UITableViewCell()
            }
            cell.configure(name: nameFiled, date: userModel.birthsday.getDateFromSting())
            return cell
        case 4:
            guard let cell = self.dequeueReusableCell(PickerTableViewCell.self) else {
                return UITableViewCell()
            }
            cell.configure(name: nameFiled, value: userModel.gender)
            return cell
        default:
            return UITableViewCell()
        }
    }
}

//MARK: - UITableViewDelegate
extension EditingTableView: UITableViewDelegate {
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}
extension EditingTableView: NameTextViewProtocol {
    func changeSize() {
        beginUpdates ()
        endUpdates ()
    }
}
