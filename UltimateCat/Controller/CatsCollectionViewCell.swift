//
//  CatsCollectionViewCell.swift
//  UltimateCat
//
//  Created by DiMa on 19/05/2020.
//  Copyright © 2020 DiMa. All rights reserved.
//

import UIKit

class CatsCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "CatsCollectionViewCell"

    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
//        imageView.layer.borderWidth = 5
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    let breedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let weightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lifeSpanLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let inteleganceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(mainImageView)
        addSubview(breedLabel)
        addSubview(weightLabel)
        addSubview(lifeSpanLabel)
        addSubview(inteleganceLabel)
        
        mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/1.5).isActive = true
        
        breedLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        breedLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10).isActive = true
        breedLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 10).isActive = true
//        breedLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        weightLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        weightLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10).isActive = true
        weightLabel.topAnchor.constraint(equalTo: breedLabel.bottomAnchor, constant: 10).isActive = true
//        weightLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        lifeSpanLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        lifeSpanLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10).isActive = true
        lifeSpanLabel.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 10).isActive = true
//        lifeSpanLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        inteleganceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        inteleganceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10).isActive = true
        inteleganceLabel.topAnchor.constraint(equalTo: lifeSpanLabel.bottomAnchor, constant: 10).isActive = true
//        inteleganceLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 20
        self.layer.shadowRadius = 9
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 5, height: 8)
        
        self.clipsToBounds = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
