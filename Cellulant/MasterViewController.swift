//
//  MasterViewController.swift
//  Cellulant
//
//  Created by Oluwafemi Faseyitan on 1/30/20.
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
class MasterViewController:UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    var detailViewController: DetailViewController? = nil
    var objects = UserLogin.sharedInstance.allUserData.datas
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    
    
    // MARK: - Table View
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects!.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserLogin.sharedInstance.selecteduser =  (objects?[indexPath.row])!
       goToNextStoryBoard(storyboardName: "Main",identifier: "DetailView")
        
    }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let object = objects![indexPath.row]
        if let userobject = object as? Datas{
            cell.textLabel!.text =  "\(userobject.first_name!) \(userobject.last_name!)"
        }
        return cell
    }
    
   func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    @objc func goToNextStoryBoard(storyboardName: String, identifier: String){
         let storyBoard: UIStoryboard = UIStoryboard(name: storyboardName, bundle: nil)
         let detailController = storyBoard.instantiateViewController(withIdentifier: identifier) as! DetailViewController
       // let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Master") as! MasterViewController
                                 //   detailController.modalPresentationStyle = .fullScreen
             self.present(detailController, animated: true, completion: nil)
       //self.navigationController!.pushViewController(detailController, animated: true)
     }
    
}

