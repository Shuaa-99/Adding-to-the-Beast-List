//
//  ViewController.swift
//  Adding-totheBeastList
//
//  Created by administrator on 04/10/2021.
//

import UIKit
let cellname = "student"

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var textAdded: UITextField!
    var studentArray = ["Shuaa","Wasan","Rod","Ahmed","Nawal"]
    override func viewDidLoad() {
        super.viewDidLoad()
       // Do any additional setup after loading the view.
        tableview.dataSource = self
        tableview.delegate = self
    }

    @IBAction func addButton(_ sender: Any) {
        if let text = textAdded.text{ //اتأكد ان الليبل فاضي عشان انفذ اللي let داخل الاقواس
            studentArray.append(text)
            let indePath = IndexPath(row: studentArray.count - 1, section: 0)
            tableview.beginUpdates()
            tableview.insertRows(at: [indePath], with: .automatic)
            tableview.endUpdates()
            textAdded.text = ""// يفضي الليبل بعد ما اضفت اللي كتبته           //  tableView.reloadData()
        }
    }
   
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath )
    cell.textLabel?.text = studentArray[indexPath.row] //to put array element in textLabel
    return cell}
 
    
  
}
