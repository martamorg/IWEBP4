//
//  Quizz10Model.swift
//  P4 Quiz10
//
//  Created by g946 DIT UPM on 18/11/2019.
//  Copyright © 2019 IWEB. All rights reserved.
//

import Foundation


struct QuizzItem: Codable {
    let id: Int
    let question: String
    let answer: String
    let author: Author?
    let attachment: Attachment?
    let favourite: Bool
    let tips: [String]
    
    struct Author: Codable {
        let isAdmin: Bool?
        let username: String
        let photo: Attachment?
    }
    
    struct Attachment: Codable {
        let filename: String
        let mime: String
        let url: URL?
    }
}


class Quizz10Model {
    
    var quizzes = [QuizzItem]()
    
    func Download() {
        
        let TOKEN = "5f8f3f83f911994a8937"
        let surl = "https://quiz.dit.upm.es/api/quizzes/random10wa?token=\(TOKEN)"
        
        guard let url = URL(string: surl) else{
            print("malamente")
            return
        }
        print("palante")
        do {
            let data = try Data(contentsOf: url)
            //la cosa de print letra
            
            let decoder = JSONDecoder()
                
            let quizzes = try decoder.decode([QuizzItem].self, from: data)
            
            self.quizzes = quizzes
            
            
        } catch  { //aqui hay q poner algo mas (error)
            print("joder")
        }
        
    }
    
}
