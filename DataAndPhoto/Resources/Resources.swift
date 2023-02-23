//
//  Resources.swift
//  DataAndPhoto
//
//  Created by Denis Kalugin on 18.02.2023.
//

import UIKit

enum Resources {
    
    enum NameFields: String, CaseIterable {
        case firstName = "Имя"
        case secondName = "Фамилия"
        case thirdName = "Отчество"
        case birthsday = "Дата рождения"
        case gender = "Пол"
    }
    
    enum Gender: String, CaseIterable {
        case noSpecified = "Не Указан"
        case man = "Мужской"
        case woman = "Женский"
    }
    
    
    
    enum Fonts {
        static func avenirNextRegular (with size: CGFloat) -> UIFont? {
            UIFont(name: "Avenir Next", size: size)
        }
    }
}
