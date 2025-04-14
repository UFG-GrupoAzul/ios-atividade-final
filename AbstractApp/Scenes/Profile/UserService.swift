//
//  UserService.swift
//  AbstractApp
//
//  Created by user272850 on 13/04/25.
//

import Foundation

class UserService {
    static func getFakeUsers() -> [User] {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        return [
            User(username: "ufg", password: "1234", name: "UFG", dateOfBirth: formatter.date(from: "1990-01-01")!, gender: "Masculino", email: "joao@ufg.br"),
            User(username: "joao", password: "1234", name: "João da Silva", dateOfBirth: formatter.date(from: "1990-05-10")!, gender: "Masculino", email: "joao@ufg.br"),
            User(username: "maria", password: "1234", name: "Maria Oliveira", dateOfBirth: formatter.date(from: "1992-08-21")!, gender: "Feminino", email: "maria@ufg.br"),
            User(username: "lucas", password: "1234", name: "Lucas Pereira", dateOfBirth: formatter.date(from: "1988-12-03")!, gender: "Masculino", email: "lucas@ufg.br"),
            User(username: "ana", password: "1234", name: "Ana Costa", dateOfBirth: formatter.date(from: "1995-03-17")!, gender: "Feminino", email: "ana@ufg.br")
        ]
    }
}
