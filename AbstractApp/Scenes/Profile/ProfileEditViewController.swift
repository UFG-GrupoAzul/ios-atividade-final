//
//  ProfileEditViewController.swift
//  AbstractApp
//
//  Created by user272843 on 4/14/25.
//
import UIKit

class ProfileEditViewController: UIViewController {
    
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var genderInput: UISegmentedControl!
    @IBOutlet weak var dateOfBirthInput: UIDatePicker!
    
    var currentUser: User?  // Armazena o usuário que será editado
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Preencher os campos com os dados do usuário logado
        if let username = StoreManager.shared.getLoggedUser() {
            if let user = UserService.getFakeUsers().first(where: { $0.username == username }) {
                currentUser = user
                userInput.text = user.username
                nameInput.text = user.name
                emailInput.text = user.email
                genderInput.selectedSegmentIndex = user.gender == "Masculino" ? 0 : 1
                dateOfBirthInput.date = user.dateOfBirth
            }
        }
    }
    
    @IBAction func saveProfileChanges(_ sender: Any) {
        guard let user = currentUser else { return }
        
        // Atualiza os dados do usuário com os novos valores
        let updatedUser = User(
            username: user.username,
            password: user.password,  // Se necessário, adicione campos de senha para editar
            name: nameInput.text ?? user.name,
            dateOfBirth: dateOfBirthInput.date,
            gender: genderInput.selectedSegmentIndex == 0 ? "Masculino" : "Feminino",
            email: emailInput.text ?? user.email
        )
        
        // Atualiza o usuário no UserService
        UserService.updateUser(updatedUser)
        
        // Exibe o alerta de sucesso
        showAlertSalvo()
    }
    
    func showAlertSalvo() {
        let alert = UIAlertController(title: "Sucesso", message: "O perfil foi salvo com sucesso!", preferredStyle: .alert)
        
        // Ação do botão OK para retornar para a tela de perfil
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            // Ao clicar em OK, volta para a tela anterior (ProfileViewController)
            self.dismiss(animated: true)
        }))
        
        // Exibe o alerta
        self.present(alert, animated: true)
    }
}

