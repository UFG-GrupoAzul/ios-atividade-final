//
//  ProfileViewController.swift
//  AbstractApp
//
//  Created by Silvano Maneck Malfatti on 04/04/25.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userImage.layer.cornerRadius = self.userImage.frame.size.height / 2
        userImage.layer.masksToBounds = true
        
        if let user = StoreManager.shared.getUser(){
            nameLabel..text = user.name
        }
    }
    
    @IBAction func handleLogoff(_ sender: Any) {
        StoreManager.shared.removeUser()
        StoreManager.shared.remove(forKey: "logged")
        self.dismiss(animated: true)
    }
}
