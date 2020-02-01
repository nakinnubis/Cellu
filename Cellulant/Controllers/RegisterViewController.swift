//
//  RegisterViewController.swift
//  Cellulant
//
//  Created by Akinnubi Abiola on 2/1/20.
//  Copyright © 2020 abiolaakinnubi.com. All rights reserved.
//

import UIKit
import Alamofire
import SwiftValidator
import SwiftSpinner
class RegisterViewController: UIViewController,ValidationDelegate {
    @IBOutlet weak var error: UILabel!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmpassword: UITextField!
    let validator = Validator()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        validator.registerField(email,errorLabel: error, rules: [EmailRule(),RequiredRule()])
        validator.registerField(password, errorLabel: error, rules: [PasswordRule(),RequiredRule(), MinLengthRule(length: 4)])
        validator.registerField(confirmpassword, errorLabel: error, rules: [PasswordRule(),RequiredRule(), MinLengthRule(length: 4)])
    }
    func validationSuccessful() {
        SwiftSpinner.hide()
        UserLogin.sharedInstance.userinfo.email = email.text;
        UserLogin.sharedInstance.userinfo.password = password.text;
        UserLogin.sharedInstance.userinfo.deviceid = UIDevice.current.identifierForVendor?.uuidString
        let user = User(email: email.text, password: password.text, deviceid: UserLogin.sharedInstance.userinfo.deviceid)
        if let encodedCredentials = try? JSONEncoder().encode(user){
            UserDefaults.standard.set(encodedCredentials,forKey: "user")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
            let loginViewController = storyBoard.instantiateViewController(withIdentifier: "Login") as! LoginViewController
            loginViewController.modalPresentationStyle = .fullScreen
            self.present(loginViewController, animated: true, completion: nil)
        }
    }
    
    func validationFailed(_ errors: [(Validatable, ValidationError)]) {
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
    
    @IBAction func register(_ sender: Any) {
        SwiftSpinner.show("Creating your account")
        if confirmpassword.text == password.text {
            validator.validate(self)
        }
        else{
             error.isHidden = false;
            error.text = "Password doesn't match each other"
        }
    }
    
}
