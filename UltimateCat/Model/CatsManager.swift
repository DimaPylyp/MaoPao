//
//  CatsManager.swift
//  UltimateCat
//
//  Created by DiMa on 05/05/2020.
//  Copyright © 2020 DiMa. All rights reserved.
//

import Foundation

struct catsManager {
    let catsURL = "https://api.thecatapi.com/v1/images/search?breed_ids=beng&include_breeds=true"
    
    func fetchCats() {
        let urlString = catsURL
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String){
           if let url = URL(string: urlString){
               let session = URLSession(configuration: .default)
               let task = session.dataTask(with: url) { (data, response, error) in
                   if error != nil{
                       print (error!)
                       return
                   }
                   
                   if let safeData = data {
                       print(safeData)
                       }
               }
                   task.resume()
           }
       }
}
