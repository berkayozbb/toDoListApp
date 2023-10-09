//
//  ViewController.swift
//  ToDoList
//
//  Created by Berkay Özbaba on 16.09.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var headerImage: UIImageView!
    @IBOutlet var textField: UITextField!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var TableView: UITableView!
    var jobList:[Any] = []
    var isDone = false
    var complatedJobList:[Any] = []
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.bookmarks, target: self, action: #selector(showCompJobButtonClicked))
        
        let newComplatedJobList = UserDefaults.standard.array(forKey: "compJobList")
        complatedJobList = newComplatedJobList ?? []
        
        let newJobList = UserDefaults.standard.array(forKey: "jobList")
        jobList = newJobList ?? []
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobList.count
    }
    
    @objc func showCompJobButtonClicked(){
        performSegue(withIdentifier: "gec", sender: complatedJobList)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gec" {
            if let destinationVC = segue.destination as? ComplatedViewController {
                if let data = sender as? [Any] {
                    destinationVC.complatedJobList = data
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = jobList[indexPath.row] as? String
//        var isDoneForEachCell = isDone
//        if isDoneForEachCell == false{
//            cell.textLabel?.textColor = UIColor.red
//        }
//        if isDoneForEachCell == true{
//            cell.textLabel?.textColor = UIColor.blue
//        }
        return cell
    }


    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
            let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
                self.jobList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                UserDefaults.standard.set(self.jobList, forKey: "jobList")
            }
            
            let complateAction = UITableViewRowAction(style: .normal, title: "Done") { (action, indexPath) in
                if let compJob = self.jobList[indexPath.row] as? String{
                    self.complatedJobList.append(compJob)
                }
                self.jobList.remove(at: indexPath.row)
                UserDefaults.standard.set(self.jobList, forKey: "jobList")
                tableView.deleteRows(at: [indexPath], with: .fade)
                UserDefaults.standard.set(self.complatedJobList, forKey: "compJobList")
            }
        print(complatedJobList)
        return[deleteAction, complateAction]
            }
            
        
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    @IBAction func addButtonClick(_ sender: Any) {
        if let job = textField.text, !job.isEmpty {
            jobList.append(job)
            textField.text = ""
            UserDefaults.standard.set(jobList, forKey: "jobList")
            TableView.reloadData()
        }
    }
}
    


