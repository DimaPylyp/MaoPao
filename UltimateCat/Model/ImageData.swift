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
    let life_span: String
    let intelligence: Int
}
