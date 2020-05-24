//
//  File.swift
//  UltimateCat
//
//  Created by DiMa on 24/05/2020.
//  Copyright © 2020 DiMa. All rights reserved.
//

import UIKit

class ParameterLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.font = UIFont.systemFont(ofSize: 14, weight: .light)
        self.textColor = .black
        self.sizeToFit()
        self.numberOfLines = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class OneCatParameterLabel: ParameterLabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.font = UIFont.systemFont(ofSize: 18, weight: .light)
        self.textColor = UIColor.label
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
