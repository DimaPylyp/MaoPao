//
//  ImageManager.swift
//  UltimateCat
//
//  Created by DiMa on 21/05/2020.
//  Copyright © 2020 DiMa. All rights reserved.
//

import Foundation

protocol ImageManagerDelegate {
    func didUpdateImage(_ imageManager: ImageManager, image: ImageModel)
    func didFailWithError(_ error: Error)
}

struct ImageManager {

    let pictureURL = "https://api.thecatapi.com/v1/images/search?&breed_ids="
    
    var delegate: ImageManagerDelegate?
    
    func fetchImage(for breed: String) {
        let urlString = pictureURL + breed + "&size=small"
        print(urlString)
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
                    if let image = self.parseJSON(safeData){
                        self.delegate?.didUpdateImage(self, image: image)
                    }
                       }
               }
                   task.resume()
           }
       }
    
    func parseJSON(_ imageData: Data) -> ImageModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData: [ImageData] = try decoder.decode([ImageData].self, from: imageData)
            var image = ImageModel(imageURL: "", breed: "", weight: "", lifeSpan: "", intelligence: 0, temperament: "", origin: "", description: "", adaptability: 0, childFriendly: 0, dogFriendly: 0, energyLevel: 0, grooming: 0, healthIssues: 0, strangerFriendly: 0, hairless: 0, hypoallergenic: 0)
            for picture in decodedData{
                let imageForBreed = picture.url
                let breed = picture.breeds[0].name
                let weight = picture.breeds[0].weight.metric
                let lifeSpan = picture.breeds[0].life_span
                let intelligence = picture.breeds[0].intelligence
                let temperament = picture.breeds[0].temperament
                let origin = picture.breeds[0].origin
                let description = picture.breeds[0].description
                let adaptability = picture.breeds[0].adaptability
                let childFriendly = picture.breeds[0].child_friendly
                let dogFriendly = picture.breeds[0].dog_friendly
                let energyLevel = picture.breeds[0].energy_level
                let grooming = picture.breeds[0].grooming
                let healthIssues = picture.breeds[0].health_issues
                let strangerFriendly = picture.breeds[0].stranger_friendly
                let hairless = picture.breeds[0].hairless
                let hypoallergenic = picture.breeds[0].hypoallergenic
                let newImage = ImageModel(imageURL: imageForBreed, breed: breed, weight: weight, lifeSpan: lifeSpan, intelligence: intelligence, temperament: temperament, origin: origin, description: description, adaptability: adaptability, childFriendly: childFriendly, dogFriendly: dogFriendly, energyLevel: energyLevel, grooming: grooming, healthIssues: healthIssues, strangerFriendly: strangerFriendly, hairless: hairless, hypoallergenic: hypoallergenic)
                image = newImage
            }
            return image
        } catch {
            delegate?.didFailWithError(error)
            return nil
        }
    }
}
