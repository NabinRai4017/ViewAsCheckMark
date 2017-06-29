//
//  TableViewController.swift
//  LearningDemo
//
//  Created by nabinrai on 2/3/17.
//  Copyright © 2017 nabin. All rights reserved.
//

import UIKit

class TableViewVC: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    
    let tableViewId = "tableViewId"
    let tableViewCellId = "tableSamipViewCell"
    var array: [Int] = []
    var selectAll = 0
    
    
    

    
    
    @IBAction func selectAllActionBtn(_ sender: UIButton) {
        let totalRows = tblView.numberOfRows(inSection: 0)
        if selectAll == 0{
        for row in 0..<totalRows {
            if array.contains(row) == false{
         array.append(row)
        }
            }
             sender.setTitle("DeSelectAll", for: .normal)
            selectAll = 1
        }else{
            array.removeAll()
             sender.setTitle("SelectAll", for: .normal)
            selectAll = 0
        }
        print(array)
        tblView.reloadData()
}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tblView.estimatedRowHeight = tblView.rowHeight
//        tblView.rowHeight = UITableViewAutomaticDimension

        // Do any additional setup after loading the view.
        tblView.delegate = self
        tblView.dataSource = self
    }
}



extension TableViewVC:UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
       return 20
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = self.tblView.dequeueReusableCell(withIdentifier: tableViewCellId, for: indexPath) as! TableViewCell
        cell.labelInTableViewCell.text = "\(indexPath.row)"
        
        if array.contains(indexPath.row){
            cell.viewInTableViewCell.backgroundColor = UIColor.black
        }else{
            cell.viewInTableViewCell.backgroundColor = UIColor.red
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

            if array.contains((indexPath.row)){
                if let itemToRemoveIndex = array.index(of:indexPath.row ) {
                    array.remove(at: itemToRemoveIndex)
                     print(array)
                    }
            
            }else{
                array.append((indexPath.row))
                print(array)
            }
    
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
 }
