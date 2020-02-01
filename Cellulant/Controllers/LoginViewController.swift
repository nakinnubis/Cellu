//
//  LoginViewController.swift
//  Cellulant
//
//  Created by Akinnubi Abiola on 1/30/20.
//  Copyright © 2020 abiolaakinnubi.com. All rights reserved.
//

import UIKit
import Alamofire
import SwiftValidator
import SwiftSpinner
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
        validator.registerField(emailAddress,errorLabel: error, rules: [EmailRule(),RequiredRule()])
        validator.registerField(password, errorLabel: error, rules: [PasswordRule(),RequiredRule(), MinLengthRule(length: 4)])
        endpoint = "\(baseUrl.getBaseUrl())";
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
                        let _user = Datas(id: id, email: email, first_name: first_name, last_name: last_name, avatar: avatar)
                        self._userData.append(_user)
                    }
                }
            }
            UserLogin.sharedInstance.allUserData.datas = self._userData
        }
        
    }
    
    func validationSuccessful() {
        SwiftSpinner.hide()
        do {
            let userinfo = UserDefaults.standard.object(forKey: "user")
            if userinfo != nil {

                let user = try JSONDecoder().decode(User.self, from: userinfo as! Data)
                let email = user.email
                let _password = user.password
                let device = user.deviceid
                //= password.text;
                if emailAddress.text == email && password.text == _password  && device != nil {
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let masterViewController = storyBoard.instantiateViewController(withIdentifier: "Master") as! MasterViewController
                   masterViewController.modalPresentationStyle = .fullScreen
                    self.present(masterViewController, animated: true, completion: nil)
                }
                else{
                    error.isHidden = false;
                    error.text = "User information doesn't exist"
                }
            }
            else{
                error.isHidden = false;
                error.text = "User information doesn't exist"
            }
        } catch let err {
            error.isHidden = false;
            error.text = "\(err.localizedDescription)"
        }
        
        
    }
    
    
    func validationFailed(_ errors:[(Validatable ,ValidationError)]) {
        // turn the fields to red
        SwiftSpinner.hide()
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
        SwiftSpinner.show("Validating your credentials")
        validator.validate(self)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
