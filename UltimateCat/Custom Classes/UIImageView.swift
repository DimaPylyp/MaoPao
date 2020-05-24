//
//  UIImageView.swift
//  UltimateCat
//
//  Created by DiMa on 21/05/2020.
//  Copyright © 2020 DiMa. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

class CustomImageView: UIImageView {
    
    var imageUrlString: String?
    
    func loadImagesUsingUrlString(urlString: String) {
        
        imageUrlString = urlString
        
        let url = NSURL(string: urlString)
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url! as URL, completionHandler: { (data, response, error) in
            if error != nil {
                print(error ?? "")
                return
            }
            
            DispatchQueue.global(qos: .background).async {
                
                // Background Thread
                
                DispatchQueue.main.async {
                    // Run UI Updates
                    
                    let imageToCache = UIImage(data: data!)
                    
                    if self.imageUrlString == urlString {
                        self.image = imageToCache
                    }
                    
                    imageCache.setObject(imageToCache!, forKey: urlString as NSString)
                    
                    self.image = imageToCache
                    
                }
            }
        }).resume()
    }
}
