//
//  CatsModel.swift
//  UltimateCat
//
//  Created by DiMa on 05/05/2020.
//  Copyright © 2020 DiMa. All rights reserved.
//

import UIKit

struct CatsModel {
    let id: String
    let breed: String
//    let weigth: String
    let lifeSpan: String
    let intelligence: Int
}

struct Constants {
    static let leftDistanceToView: CGFloat = 40
    static let rightDistanceToView: CGFloat = 40
    static let galeryMinimumLineSpaciong: CGFloat = 10
    static let CatsItemWidth = (UIScreen.main.bounds.width - Constants.leftDistanceToView - Constants.rightDistanceToView - (Constants.galeryMinimumLineSpaciong / 2)) / 1
}
