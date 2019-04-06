//
//  UsersTableViewController.swift
//  prueba-login-bat
//
//  Created by yelyah on 4/4/19.
//  Copyright © 2019 yelyah. All rights reserved.
//

import UIKit
import SwiftyJSON

class UsersTableViewController: UITableViewController {
    
    var myJSON = JSON(stringLiteral: " ")

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myJSON["results"].count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let index = indexPath.item
        
        let name = myJSON["results"][index]["name"]["first"].stringValue
        let lastName = myJSON["results"][index]["name"]["last"].stringValue
        let email = myJSON["results"][index]["email"].stringValue
        
        cell.textLabel?.text = name + " " + lastName
        cell.detailTextLabel?.text = email
        

        return cell
    }

}
