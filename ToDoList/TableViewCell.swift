//
//  TableViewCell.swift
//  ToDoList
//
//  Created by Berkay Özbaba on 16.09.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var jobNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        jobNameLabel?.isUserInteractionEnabled = true
//        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeColor))
//        jobNameLabel?.addGestureRecognizer(gestureRecognizer)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
//    @objc func changeColor(){
//        if jobNameLabel.textColor == UIColor(red: 0, green: 150, blue: 0, alpha: 0){
//            jobNameLabel.textColor = UIColor(red: 150, green: 0, blue: 0, alpha: 0)
//        }
//        else{
//            jobNameLabel.textColor == UIColor(red: 0, green: 150, blue: 0, alpha: 0)
//        }
//    }

}
