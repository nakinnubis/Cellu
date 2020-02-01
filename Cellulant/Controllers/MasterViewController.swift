//
//  MasterViewController.swift
//  Cellulant
//
//  Created by Akinnubi Abiola on 1/30/20.
//  Copyright © 2020 abiolaakinnubi.com. All rights reserved.
//

import UIKit

class MasterViewController:UIViewController,UITableViewDataSource,UITableViewDelegate{
    var endpoint: String?
       let baseUrl = SetBaseUrl()
     var _userData = [Datas]()
    var pageid = 1;
    var detailViewController: DetailViewController? = nil
    var objects = UserLogin.sharedInstance.allUserData.datas
    @IBOutlet weak var loadmoreBtn: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.tableView.tableFooterView = loadmoreBtn
    }
    
    
    
    
    // MARK: - Table View
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  objects?.count ?? 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //   tableView.deselectRow(at: indexPath, animated: true)
        //  performSegue(withIdentifier: "showDetail", sender: self)
        UserLogin.sharedInstance.selecteduser =  (objects?[indexPath.row])!
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        print(UserLogin.sharedInstance.selecteduser)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        //    nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: true, completion: nil)
        // self.navigationController?.present(nextViewController, animated: false, completion: nil)
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let object = objects![indexPath.row]
        if let userobject = object as? Datas{
            cell.textLabel!.text =  "\(userobject.first_name!) \(userobject.last_name!)"
        }
        //cell.textLabel!.text  = "Abiola Akinnubi"
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    @IBAction func loadMore(_ sender: Any) {
        pageid += 1
        endpoint = "\(baseUrl.getBaseUrl())?page=\(pageid)";
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
            self.objects =  UserLogin.sharedInstance.allUserData.datas! + self._userData
            self.tableView.reloadData()
        }
    }
    
  
}

