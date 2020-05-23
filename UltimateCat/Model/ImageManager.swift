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
            var image = ImageModel(imageURL: "", breed: "", lifeSpan: "", intelligence: 0)
            for picture in decodedData{
                let imageForBreed = picture.url
                let breed = picture.breeds[0].name
                let lifeSpan = picture.breeds[0].life_span
                let intelligence = picture.breeds[0].intelligence
                let newImage = ImageModel(imageURL: imageForBreed, breed: breed, lifeSpan: lifeSpan, intelligence: intelligence)
                image = newImage
            }
            return image
        } catch {
            delegate?.didFailWithError(error)
            return nil
        }
    }
}
