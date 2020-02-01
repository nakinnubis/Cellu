//
//  DetailViewController.swift
//  Cellulant
//
//  Created by Akinnubi Abiola on 1/30/20.
//  Copyright © 2020 abiolaakinnubi.com. All rights reserved.
//

import UIKit
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var firstNameLastName: UILabel!

    @IBOutlet weak var avarta: UIImageView!
    
    @IBOutlet weak var emailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   guard let firstName =  UserLogin.sharedInstance.selecteduser.first_name else { return  }
        guard let lastName =    UserLogin.sharedInstance.selecteduser.last_name else { return  }
       guard let email =  UserLogin.sharedInstance.selecteduser.email else { return  }
        guard let image_url =  UserLogin.sharedInstance.selecteduser.avatar else { return  }
     
        loadData(firstName: firstName, lastName: lastName, email: email, image_url: image_url)
    }

    func loadData(firstName: String, lastName: String,email: String, image_url: String) -> Void {
        firstNameLastName.text = "Full name: \(firstName) \(lastName)"
            emailLabel.text = "Email Address: \(email)"
            //avarta.image = UIImage(
                //.imageView.load(url: UserLogin.sharedInstance.selecteduser.avatar)
        let url = URL(string: image_url)!
        avarta.load(url: url)
    }

}

