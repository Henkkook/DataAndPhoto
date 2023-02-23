//
//  PickerTableViewCell.swift
//  DataAndPhoto
//
//  Created by Denis Kalugin on 19.02.2023.
//

import UIKit

final class PickerTableViewCell: UITableViewCell {

    
    static var idPickerViewCell = "idPickerViewCell"
    
    private let nameLabel = UILabel()
    private let genderPicker = GenderPickerView()
    private let genderTextField = GenderTextField()
  
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setConstraints()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        selectionStyle = .none
        
        nameLabel.font = Resources.Fonts.avenirNextRegular(with: 18)
        addView(nameLabel)
        
        genderPicker.genderDelegate = self
        genderTextField.inputView = genderPicker
        contentView.addView(genderTextField)
      
      
    }
    
    public func configure(name: String, value: String) {
        nameLabel.text = name
        genderTextField.text = value
    }
    public func getCellValue() -> String {
        guard let  text = genderTextField.text else { return ""}
        return text
    }
}

//MARK: - GenderPickerViewProtocol

extension PickerTableViewCell: GenderPickerViewProtocol {
    func didSelect(row: Int) {
        genderTextField.text = Resources.Gender.allCases[row].rawValue
        genderTextField.resignFirstResponder()
    }
    
    
}


    //MARK: - Set Constraints
    
    extension PickerTableViewCell {
        private func setConstraints() {
            NSLayoutConstraint.activate([
                nameLabel.centerYAnchor.constraint (equalTo: centerYAnchor),
                nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                nameLabel.widthAnchor.constraint (equalTo: widthAnchor, multiplier: 0.35),
                
                genderTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                genderTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
                genderTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
                genderTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
                
                
            ])
        }
    }
