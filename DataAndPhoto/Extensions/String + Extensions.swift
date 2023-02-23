//
//  String + Extensions.swift
//  DataAndPhoto
//
//  Created by Denis Kalugin on 23.02.2023.
//

import Foundation

extension String {
    
    func getDateFromSting() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let date = dateFormatter.date(from: self) ?? Date()
        return date
    }
}
