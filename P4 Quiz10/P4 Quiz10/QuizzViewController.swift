//
//  QuizzViewController.swift
//  P4 Quiz10
//
//  Created by g946 DIT UPM on 18/11/2019.
//  Copyright © 2019 IWEB. All rights reserved.
//

import UIKit

class QuizzViewController: UIViewController {
    
    var quiz: QuizzItem!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var attachementImageView: UIImageView!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    //faltan por añadir oulets del nombre del autor y noseq mas 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = quiz.question
        answerLabel.text = quiz.answer
        
        attachementImageView.image = UIImage(named: "none")!
        if let url = quiz.attachment?.url {
            attachementImageView.image = image(url: url)
        }
        
        photoImageView.image = UIImage(named: "none")!
        if let url = quiz.author?.photo?.url {
            photoImageView.image = image(url: url)
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
