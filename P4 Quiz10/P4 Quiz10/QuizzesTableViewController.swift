//
//  QuizzesTableViewController.swift
//  P4 Quiz10
//
//  Created by g946 DIT UPM on 18/11/2019.
//  Copyright © 2019 IWEB. All rights reserved.
//

import UIKit

class QuizzesTableViewController: UITableViewController {
    
    var quizz10Model = Quizz10Model()

    override func viewDidLoad() {
        super.viewDidLoad()

        quizz10Model.Download()
        tableView.reloadData()
    }
    
    
    @IBSegueAction func showQuizzDetails(_ coder: NSCoder) -> QuizzViewController? {
        
        let qvc = QuizzViewController(coder: coder)!
        
        let row = tableView.indexPathForSelectedRow!.row
        
        qvc.quiz = quizz10Model.quizzes[row]
        
        return qvc
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizz10Model.quizzes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Quizz Cell", for: indexPath) as! QuizzCell

        // Configure the cell...
        
        let row = indexPath.row
        let quizz = quizz10Model.quizzes[row]
        
        cell.questionLabel.text = quizz.question
        cell.imgView.image = UIImage(named: "none") //cambiar luego la imagen
        
    
        if let url = quizz.attachment?.url {
            let img = image(url: url)
                cell.imgView.image = img
            }
        
        

        return cell
    }
    
    @IBAction func refreshQuestions(_ sender: Any) {
        
        quizz10Model.Download()
        self.tableView.reloadData()
    }
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
