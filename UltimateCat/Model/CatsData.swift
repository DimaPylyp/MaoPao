//
//  CatsData.swift
//  UltimateCat
//
//  Created by DiMa on 05/05/2020.
//  Copyright © 2020 DiMa. All rights reserved.
//

import UIKit

struct CatsData: Decodable {

    let id: String
    let name: String
//    let weigth: Weight
    let life_span: String
    let intelligence: Int
}

//struct Weight: Decodable {
//    let metric: String
//}
