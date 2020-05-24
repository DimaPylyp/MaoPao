//
//  BackButton.swift
//  UltimateCat
//
//  Created by DiMa on 24/05/2020.
//  Copyright © 2020 DiMa. All rights reserved.
//

import UIKit

class BackButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setImage(UIImage(named: K.backArrowImageName), for: .normal)
        self.frame.size = CGSize(width: 20, height: 20)
        self.imageView?.contentMode = .scaleToFill
        self.contentMode = .scaleToFill
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
