//
//  UserService.swift
//  AbstractApp
//
//  Created by user272850 on 13/04/25.
//

import Foundation

class UserService {
    // Armazena os usuários em uma variável estática, que pode ser modificada
    private static var users: [User] = getInitialUsers()

    // Função para obter os usuários
    static func getFakeUsers() -> [User] {
        return users
    }

    // Função para atualizar um usuário específico
    static func updateUser(_ updatedUser: User) {
        if let index = users.firstIndex(where: { $0.username == updatedUser.username }) {
            users[index] = updatedUser
        }
    }

    // Função para obter os dados iniciais dos usuários
    private static func getInitialUsers() -> [User] {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        return [
            User(username: "ufg", password: "1234", name: "Universidade Federal de Goiás", dateOfBirth: formatter.date(from: "1990-01-01")!, gender: "Masculino", email: "joao@ufg.br"),
            User(username: "joao", password: "1234", name: "João da Silva", dateOfBirth: formatter.date(from: "1990-05-10")!, gender: "Masculino", email: "joao@ufg.br"),
            User(username: "maria", password: "1234", name: "Maria Oliveira", dateOfBirth: formatter.date(from: "1992-08-21")!, gender: "Feminino", email: "maria@ufg.br"),
            User(username: "lucas", password: "1234", name: "Lucas Pereira", dateOfBirth: formatter.date(from: "1988-12-03")!, gender: "Masculino", email: "lucas@ufg.br"),
            User(username: "ana", password: "1234", name: "Ana Costa", dateOfBirth: formatter.date(from: "1995-03-17")!, gender: "Feminino", email: "ana@ufg.br")
        ]
    }
}
