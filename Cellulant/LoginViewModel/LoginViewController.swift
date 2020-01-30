//
//  LoginViewController.swift
//  Cellulant
//
//  Created by Oluwafemi Faseyitan on 1/30/20.
//  Copyright © 2020 abiolaakinnubi.com. All rights reserved.
//

import UIKit
import Alamofire
import SwiftValidator
class LoginViewController: UIViewController,ValidationDelegate {
let validator = Validator()
    var endpoint: String?
    let baseUrl = SetBaseUrl()
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var password: UITextField!
    //let restfulApi = RestfulApi()
    var _userData = [Datas]()
    @IBOutlet weak var error: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        validator.registerField(emailAddress, rules: [EmailRule(),RequiredRule()])
        validator.registerField(password, rules: [PasswordRule(),RequiredRule(), MinLengthRule(length: 4)])
        endpoint = baseUrl.getBaseUrl();
        let restfulApi = RestfulApi(parameters: ["":""],endpoint: endpoint!)
        restfulApi.getRequestWithoutParamters { (JsonP, Error) in
            if let userData = JsonP as? [String: Any]{
                if let user_data = userData["data"] as? [AnyObject]{
                    for item in user_data {
                        guard let id = item["id"] as? Int else {
                        return
                        }
                        guard let email = item["email"] as? String else {
                            return
                        }
                        guard let first_name = item["first_name"] as? String else {
                            return
                        }
                        guard let last_name = item["last_name"] as? String else {
                            return
                        }
                        guard let avatar = item["avatar"] as? String else {
                            return
                        }
                        var _user = Datas(id: id, email: email, first_name: first_name, last_name: last_name, avatar: avatar)
                        self._userData.append(_user)
                    }
                }
            }
            UserLogin.sharedInstance.allUserData.datas = self._userData
        }
     
    }
    
    func validationSuccessful() {
        UserLogin.sharedInstance.userinfo.email = emailAddress.text;
        UserLogin.sharedInstance.userinfo.password = password.text;
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                               let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Master") as! MasterViewController
                               nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: true, completion: nil)
    }
    
   
    func validationFailed(_ errors:[(Validatable ,ValidationError)]) {
        // turn the fields to red
        for (field, error) in errors {
            if let field = field as? UITextField {
                field.layer.borderColor = UIColor.red.cgColor
                field.layer.borderWidth = 1.0
            }
            error.errorLabel?.text = error.errorMessage // works if you added labels
            error.errorLabel?.isHidden = false
        }
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        validator.validate(self)
    }
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       self.view.endEditing(true)
       return false
   }
}
