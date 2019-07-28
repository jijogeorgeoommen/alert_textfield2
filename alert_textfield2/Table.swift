//
//  Table.swift
//  alert_textfield2
//
//  Created by JIJO G OOMMEN on 05/07/19.
//  Copyright © 2019 JIJO G OOMMEN. All rights reserved.
//

import UIKit
import CoreData

class Table: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var name_array : [User] = []

    @IBOutlet var tableviewoutlet: UITableView!
    
//---------1.CONNECTING VIEW CONTEXT IN AppDelegate--//
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
//----------END OF CODE CONNECTING VIEW CONTEXT-----//
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.fetchData()
        self.tableviewoutlet.reloadData()
      
    }
    
//---------------3.TABLE VIEW FUNCTIONS-------------//
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name_array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableviewoutlet.dequeueReusableCell(withIdentifier: "Cellid", for: indexPath)
        cell.textLabel?.text = name_array[indexPath.row].name
        return cell
        
    }
    
//------------CODE TO DELETE A ROW IN TABLE VIEW----//
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            
            let item = name_array[indexPath.row]
            name_array.remove(at: indexPath.row)
            context.delete(item)
            
            do {
                try context.save()
            } catch {
                print("Error deleting items with \(error)")
            }
            tableviewoutlet.deleteRows(at: [indexPath], with: .automatic)  //includes updating UI so reloading is not necessary
        }
    }
 //----------END OF ROW DELETING CODE--------------//
    
    
    
 //-------------END OF TABLE VIEW FUNCTION-----------//
    
    
//--------------2.CODE TO FETCH DATA-----------------//
    
    func fetchData() {
        do {
            name_array = try
            context.fetch(User.fetchRequest())
        }
        catch{
            print("error")
        }
    }
    
//-----------------END OF FETCHING CODE--------------//

   
}
