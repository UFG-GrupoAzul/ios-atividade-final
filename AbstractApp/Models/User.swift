//
//  User.swift
//  AbstractApp
//
//  Created by user272850 on 13/04/25.
//

import Foundation

struct User: Codable {
    let username: String
    let password: String
    let name: String
    let dateOfBirth: Date
    let gender: String
    let email: String
    
    var formattedDateOfBirth: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: dateOfBirth)
    }
}
