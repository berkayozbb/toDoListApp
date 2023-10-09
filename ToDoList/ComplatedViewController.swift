//
//  ComplatedViewController.swift
//  ToDoList
//
//  Created by Berkay Özbaba on 16.09.2023.
//

import UIKit

class ComplatedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var complatedJobList:[Any] = []
    
    @IBOutlet var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return complatedJobList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "compCell", for: indexPath)
        cell.textLabel?.text = complatedJobList[indexPath.row] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
            let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
                self.complatedJobList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                UserDefaults.standard.set(self.complatedJobList, forKey: "compJobList")
            }
            
        return[deleteAction]
            }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(complatedJobList)
        let newComplatedJobList = UserDefaults.standard.array(forKey: "compJobList")
        complatedJobList = newComplatedJobList ?? []
        
    }
    
}
