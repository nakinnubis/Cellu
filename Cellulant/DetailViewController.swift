//
//  DetailViewController.swift
//  Cellulant
//
//  Created by Oluwafemi Faseyitan on 1/30/20.
//  Copyright © 2020 abiolaakinnubi.com. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var firstNameLastName: UILabel!
    @IBOutlet weak var avarta: UIImageView!
    
    @IBOutlet weak var emailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstNameLastName.text = "Full name: \(UserLogin.sharedInstance.selecteduser.first_name!) \(UserLogin.sharedInstance.selecteduser.last_name!)"
        emailLabel.text = "Email Address: \(UserLogin.sharedInstance.selecteduser.email!)"
        //avarta.image = UIImage(
            //.imageView.load(url: UserLogin.sharedInstance.selecteduser.avatar)
        let url = URL(string: UserLogin.sharedInstance.selecteduser.avatar!)
      // avarta.image.load(url: url!)
    }



}

