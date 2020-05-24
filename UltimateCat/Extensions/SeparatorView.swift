//
//  SeparatorView.swift
//  UltimateCat
//
//  Created by DiMa on 24/05/2020.
//  Copyright © 2020 DiMa. All rights reserved.
//

import UIKit

class SeparatorView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.opacity = 0.2
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
