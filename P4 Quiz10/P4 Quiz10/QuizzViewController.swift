///Users/g946/Desktop/P4 Quiz10/P4 Quiz10/Base.lproj/Main.storyboard
//  QuizzViewController.swift
//  P4 Quiz10
//
//  Created by g946 DIT UPM on 18/11/2019.
//  Copyright © 2019 IWEB. All rights reserved.
//

import UIKit

class QuizzViewController: UIViewController,
    UITextFieldDelegate{
    
    var quiz: QuizzItem!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var attachementImageView: UIImageView!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var responseTextField: UITextField!
    
    
    
    var quizz10Model = Quizz10Model()

    //añadir text field para respuestas
    //hacer resizesing 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = quiz.question
        //answerLabel.text = quiz.answer
        authorLabel.text = quiz.author?.username
        
        attachementImageView.image = UIImage(named: "none")!
        if let url = quiz.attachment?.url {
            attachementImageView.image = image(url: url)
        }
        
        photoImageView.image = UIImage(named: "none")!
        if let url = quiz.author?.photo?.url {
            photoImageView.image = image(url: url)
        }

    }

    
    
    @IBAction func responseEnter(_ sender: UITextField) {
        
        let respuesta = sender.text?.lowercased()
        if respuesta == quiz.answer.lowercased() {
            alert(msg: "CORRECTO")
        } else{
            alert(msg: "INCORRECTO")
        }
        
    }
    
    
    
    
    @IBAction func checkButton() {
        
        
        let respuesta = responseTextField.text?.lowercased()
        
        if respuesta == quiz.answer.lowercased() {
            alert(msg: "CORRECTO")
        } else{
            alert(msg: "INCORRECTO")
        }
        
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
