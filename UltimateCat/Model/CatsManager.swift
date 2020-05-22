//
//  CatsManager.swift
//  UltimateCat
//
//  Created by DiMa on 05/05/2020.
//  Copyright © 2020 DiMa. All rights reserved.
//

import Foundation

protocol CatsManagerDelegate {
    func didUpdateCats(_ catsManager: CatsManager, cats: [CatsModel])
    func didFailWithError(_ error: Error)
}

struct CatsManager {
//    let catsURL = "https://api.thecatapi.com/v1/images/search?include_breeds=true&x-api-key=81851877-a0b7-4176-8084-82741daf0618&limit=60&order=ASC&has_breeds=1"
    let catsURL = "https://api.thecatapi.com/v1/breeds"
    
    var delegate: CatsManagerDelegate?
    
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
//                    let dataString = String(data: safeData, encoding: .utf8)
//                       print(dataString)
                    if let cats = self.parseJSON(safeData){
                        self.delegate?.didUpdateCats(self, cats: cats)
                    }
                       }
               }
                   task.resume()
           }
       }
    
    func parseJSON(_ catsData: Data) -> [CatsModel]? {
        let decoder = JSONDecoder()
        do {
            let decodedData: [CatsData] = try decoder.decode([CatsData].self, from: catsData)
            var i = 0
            var cats: [CatsModel] = []
            for cat in decodedData{
                i += 1
                print(i)

                let id = cat.id
                let breed = cat.name
//                let weight = cat.weigth.metric
                let intelligence = cat.intelligence
                let lifeSpan = cat.life_span
                let cat = CatsModel(id: id, breed: breed, lifeSpan: lifeSpan, intelligence: intelligence)
                cats.append(cat)
            }
            print(cats)
            return cats
        } catch {
            delegate?.didFailWithError(error)
            return nil
        }
    }
}
