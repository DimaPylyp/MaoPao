//
//  ImageData.swift
//  UltimateCat
//
//  Created by DiMa on 21/05/2020.
//  Copyright © 2020 DiMa. All rights reserved.
//

import Foundation

struct ImageData: Decodable {
    let breeds: [Breed]
    let url: String
}

struct Breed: Decodable {
    let name: String
    let weight: Weight
    let life_span: String
    let intelligence: Int
    let temperament: String
    let origin: String
    let description: String
    let adaptability: Int
    let child_friendly: Int
//    let cat_friendly: Int
    let dog_friendly: Int
    let energy_level: Int
    let grooming: Int
    let health_issues: Int
    let stranger_friendly: Int
    let hairless: Int
    let hypoallergenic: Int
}

struct Weight: Decodable {
    let metric: String
}
