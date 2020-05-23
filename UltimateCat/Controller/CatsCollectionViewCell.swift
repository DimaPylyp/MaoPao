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
    
    var cat: ImageModel?{
        didSet{
            
            setupImage()
            
            breedLabel.text = cat?.breed
            lifeSpanLabel.text = cat?.lifeSpan
            
            if let intelligance = cat?.intelligence {
                let intelliganceText = "Intelligance: \(intelligance)"
                intelliganceLabel.text = intelliganceText
            }
        }
    }
    
    func setupImage() {
        if let imageUrl = cat?.imageURL {
            mainImageView.loadImagesUsingUrlString(urlString: imageUrl)
        }
    }
    
    let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
//        view.frame.size = CGSize(width: 100, height: 100)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        return view
    }()

    let mainImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
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
    
    let intelliganceLabel: UILabel = {
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
        
        addSubview(cardView)
//        addSubview(mainImageView)
//        addSubview(breedLabel)
//        addSubview(weightLabel)
//        addSubview(lifeSpanLabel)
//        addSubview(intelliganceLabel)
        cardView.addSubview(mainImageView)
        cardView.addSubview(breedLabel)
        cardView.addSubview(weightLabel)
        cardView.addSubview(lifeSpanLabel)
        cardView.addSubview(intelliganceLabel)
        
        cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        cardView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true

        
        mainImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor).isActive = true
        mainImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: cardView.topAnchor).isActive = true
        mainImageView.heightAnchor.constraint(equalTo: cardView.heightAnchor, multiplier: 1/1.5).isActive = true
        
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

        intelliganceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        intelliganceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10).isActive = true
        intelliganceLabel.topAnchor.constraint(equalTo: lifeSpanLabel.bottomAnchor, constant: 10).isActive = true
//        inteleganceLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        cardView.layer.cornerRadius = 20
        cardView.layer.shadowRadius = 1
        cardView.layer.shadowOpacity = 0.3
        cardView.layer.shadowOffset = CGSize(width: 5, height: 8)
        
        cardView.clipsToBounds = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
