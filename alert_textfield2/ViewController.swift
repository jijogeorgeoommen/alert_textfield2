//
//  ViewController.swift
//  alert_textfield2
//
//  Created by JIJO G OOMMEN on 04/07/19.
//  Copyright © 2019 JIJO G OOMMEN. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet var textfieldouT: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
//------2.CONNECTING VIEW CONTEXT FROM AppDelegate----//
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
//------END OF THE CONNECTING CODE FROM AppDelegate--//
    
    
    
//----------------1.ALERT BOX CODE-------------------//

    @IBAction func enterData(_ sender: Any) {
        
        let alert = UIAlertController(title: "NEW ENTRY", message: "Enter the data in the text field", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "save", style: .default, handler: { (text) in
            guard let textfield = alert.textFields?.first
                else {
                    return
            }
            
            self.textfieldouT.text = textfield.text
        }))
        
        
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        alert.addTextField()
        
        self.present(alert,animated: true,completion: nil)
        
    }
    
//-----------------END OF ALERT BOX CODE--------------//
    
    
//------------------3.ADDING DATA TO THE TABLE--------//
    
    @IBAction func aDdTotAble(_ sender: UIButton) {
     
        if (textfieldouT.text != ""){
         
let new_name = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)    //User = Entity name
            
new_name.setValue(self.textfieldouT.text, forKey: "name") //name = field in attribute
     
            do {
                try context.save()
                print(new_name)
                print("saved")
            }
            catch{
                print("error")
            }
        }
        
    }
    
//----------END OF CODE ADDING DATA TO THE TABLE------//
    
    
}

