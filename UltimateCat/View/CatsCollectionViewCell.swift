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
                
            if let lifeSpan = cat?.lifeSpan {
                let lifeSpanText = "Life span: \(lifeSpan) years"
                lifeSpanLabel.text = lifeSpanText
            }
            
            if let weight = cat?.weight {
                let weightText = "Weight: \(weight) kg"
                weightLabel.text = weightText
            }
            
            if let intelligance = cat?.intelligence {
                let intelliganceText = "Intelligance: \(intelligance)"
                intelliganceLabel.text = intelliganceText
            }
            
            if let adaptability = cat?.adaptability {
                let adaptabilityText = "Adaptability: \(adaptability)"
                adaptabilityLabel.text = adaptabilityText
            }
            
            if let grooming = cat?.grooming {
                let groomingText = "Grooming: \(grooming)"
                groomingLabel.text = groomingText
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
        view.backgroundColor = .white
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
    
    let breedLabel: ParameterLabel = {
        let label = ParameterLabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    let weightLabel = ParameterLabel()
    
    let lifeSpanLabel = ParameterLabel()
    
    let intelliganceLabel = ParameterLabel()
    
    let adaptabilityLabel = ParameterLabel()
    
    let groomingLabel = ParameterLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        addSubview(cardView)
        cardView.addSubview(mainImageView)
        cardView.addSubview(breedLabel)
        cardView.addSubview(weightLabel)
        cardView.addSubview(lifeSpanLabel)
        cardView.addSubview(intelliganceLabel)
        cardView.addSubview(adaptabilityLabel)
        cardView.addSubview(groomingLabel)
        
        cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        cardView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true

        
        mainImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor).isActive = true
        mainImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: cardView.topAnchor).isActive = true
        mainImageView.heightAnchor.constraint(equalTo: cardView.heightAnchor, multiplier: 1/1.5).isActive = true
        
        breedLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10).isActive = true
        breedLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: 10).isActive = true
        breedLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 10).isActive = true

        weightLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10).isActive = true
        weightLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: 10).isActive = true
        weightLabel.topAnchor.constraint(equalTo: breedLabel.bottomAnchor, constant: 10).isActive = true

        lifeSpanLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10).isActive = true
        lifeSpanLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: 10).isActive = true
        lifeSpanLabel.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 10).isActive = true

        intelliganceLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10).isActive = true
        intelliganceLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: 10).isActive = true
        intelliganceLabel.topAnchor.constraint(equalTo: lifeSpanLabel.bottomAnchor, constant: 10).isActive = true
        
        adaptabilityLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10).isActive = true
        adaptabilityLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: 10).isActive = true
        adaptabilityLabel.topAnchor.constraint(equalTo: intelliganceLabel.bottomAnchor, constant: 10).isActive = true
        
        groomingLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10).isActive = true
        groomingLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: 10).isActive = true
        groomingLabel.topAnchor.constraint(equalTo: adaptabilityLabel.bottomAnchor, constant: 10).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.cornerRadius = 20
        cardView.layer.shadowRadius = 9
        cardView.layer.shadowOpacity = 0.3
        cardView.layer.shadowOffset = CGSize(width: 5, height: 8)
        
        cardView.clipsToBounds = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
