//
//  Date + Extensions.swift
//  DataAndPhoto
//
//  Created by Denis Kalugin on 23.02.2023.
//

import Foundation

extension Date {
    
    func getStringFromDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
}
