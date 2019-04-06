//
//  SecondViewController.swift
//  prueba-login-bat
//
//  Created by yelyah on 4/4/19.
//  Copyright © 2019 yelyah. All rights reserved.
//

import UIKit
import Firebase
import CoreData

class SecondViewController: UIViewController {

    var theInfo = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("second view has loaded")
        
        let ref: DatabaseReference!
        ref = Database.database().reference(withPath: "info")
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"BatteryEvents")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                if (data.value(forKey: "synced") as! Bool == false){
                    let uuid = UUID().uuidString
                    ref.child("events/" + uuid + "/timestamp").setValue(data.value(forKey: "date") as! String)
                    ref.child("events/" + uuid + "/percentage").setValue(data.value(forKey: "percentage") as Any)
                    data.setValue(true, forKey: "synced")
                }
            }
            
        } catch {
            
            print("Failed")
        }
        
    
    }

}
