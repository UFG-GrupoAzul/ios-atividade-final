//
//  ProfileViewController.swift
//  AbstractApp
//
//  Created by Silvano Maneck Malfatti on 04/04/25.
//
import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userImage.layer.cornerRadius = self.userImage.frame.size.height / 2
        userImage.layer.masksToBounds = true
        if let username = StoreManager.shared.getLoggedUser() {
            // Buscar o objeto User em algum array ou fonte de dados:
            if let user = UserService.getFakeUsers().first(where: { $0.username == username }) {
                nameLabel.text = user.name
                loginLabel.text = user.username
                emailLabel.text = user.email
                dateOfBirthLabel.text = user.formattedDateOfBirth
                genderLabel.text = user.gender
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Carregar as informações do usuário logado a partir do UserService
        if let username = StoreManager.shared.getLoggedUser() {
            if let user = UserService.getFakeUsers().first(where: { $0.username == username }) {
                nameLabel.text = user.name
                loginLabel.text = user.username
                emailLabel.text = user.email
                dateOfBirthLabel.text = user.formattedDateOfBirth
                genderLabel.text = user.gender
            }
        }
    }

    @IBAction func handleLogoff(_ sender: Any) {
        StoreManager.shared.removeLoggedUser()
        StoreManager.shared.remove(forKey: "logged")
        self.dismiss(animated: true)
    }
    @IBAction func editButtonTapped(_ sender: UIButton) {
        presentEditProfile()
    }

    func presentEditProfile() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let editVC = storyboard.instantiateViewController(withIdentifier: "ProfileEditViewController") as? ProfileEditViewController {
            editVC.modalPresentationStyle = .fullScreen
            editVC.modalTransitionStyle = .coverVertical
            self.present(editVC, animated: true)
        }
    }

}
