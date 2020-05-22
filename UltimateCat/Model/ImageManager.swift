//
//  ImageManager.swift
//  UltimateCat
//
//  Created by DiMa on 21/05/2020.
//  Copyright © 2020 DiMa. All rights reserved.
//

import Foundation

protocol ImageManagerDelegate {
    func didUpdateImage(_ imageManager: ImageManager, image: [ImageModel])
    func didFailWithError(_ error: Error)
}

struct ImageManager {

    let pictureURL = "https://api.thecatapi.com/v1/images/search?&breed_ids="
    
    var delegate: ImageManagerDelegate?
    
    func fetchImage(for breed: String) {
        let urlString = pictureURL + breed + "&size=full"
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
                    if let image = self.parseJSON(safeData){
                        self.delegate?.didUpdateImage(self, image: image)
                    }
                       }
               }
                   task.resume()
           }
       }
    
    func parseJSON(_ imageData: Data) -> [ImageModel]? {
        let decoder = JSONDecoder()
        do {
            let decodedData: [ImageData] = try decoder.decode([ImageData].self, from: imageData)
            var i = 0
            var image: [ImageModel] = []
            for picture in decodedData{
                i += 1
                print(i)
                let imageForBreed = picture.url
                let newImage = ImageModel(imageURL: imageForBreed)
                image.append(newImage)
            }
            print(image)
            return image
        } catch {
            delegate?.didFailWithError(error)
            return nil
        }
    }
}
