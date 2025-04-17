//
//  User.swift
//  AbstractApp
//
//  Created by user272850 on 13/04/25.
//

import Foundation

struct User: Codable {
    var username: String
    var password: String
    var name: String
    var dateOfBirth: Date
    var gender: String
    var email: String

    var formattedDateOfBirth: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: dateOfBirth)
    }
}
