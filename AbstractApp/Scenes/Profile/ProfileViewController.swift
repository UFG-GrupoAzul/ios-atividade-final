//
//  ProfileViewController.swift
//  AbstractApp
//
//  Created by Silvano Maneck Malfatti on 04/04/25.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userImage.layer.cornerRadius = self.userImage.frame.size.height / 2
        userImage.layer.masksToBounds = true
    }
    
    @IBAction func handleLogoff(_ sender: Any) {
        StoreManager.shared.remove(forKey: "logged")
        self.dismiss(animated: true)
    }
}
