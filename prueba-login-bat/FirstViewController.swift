//
//  FirstViewController.swift
//  prueba-login-bat
//
//  Created by yelyah on 4/4/19.
//  Copyright © 2019 yelyah. All rights reserved.
//

import UIKit
import SwiftyJSON

class FirstViewController: UIViewController {

    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var loginLabel: UILabel!
    
    var username = String()
    var password = String()
    var myjson = JSON()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginLabel.isHidden = true
        let myurl = URL(string: "https://randomuser.me/api?results=20&seed=smartstc&nat=ES")
        let data = try? Data.init(contentsOf: myurl!)
        myjson = try! JSON(data: data!)
        
        username = myjson["results"][0]["login"]["username"].stringValue
        password = myjson["results"][0]["login"]["password"].stringValue
        
        print(username)
        print(password)
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "FirstToUsersSegue" {
            if (userText.text == username && passText.text == password) {
                return true
            }
        }
        
        let alertController = UIAlertController(
            title: "Error",
            message: "Error al iniciar sesión",
            preferredStyle: .alert
        )
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        present(alertController, animated: true, completion: nil)
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "FirstToUsersSegue"){
            let FirstToUsersViewController = segue.destination
            let FirstToUsersVC:UsersTableViewController = ((FirstToUsersViewController as? UsersTableViewController ?? nil)!)
            FirstToUsersVC.myJSON = myjson
        }
    }


}

