//
//  OneCatViewController.swift
//  UltimateCat
//
//  Created by DiMa on 23/05/2020.
//  Copyright © 2020 DiMa. All rights reserved.
//

import UIKit


class OneCatViewController: UIViewController {
    
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
            
            if let healthIssues = cat?.healthIssues {
                let healthIssuesText = "Health issues: \(healthIssues)"
                healthIssuesLabel.text = healthIssuesText
            }
            
            if let energyLevel = cat?.energyLevel {
                let energyLevelText = "Energy level: \(energyLevel)"
                energyLevelLabel.text = energyLevelText
            }
            
            if let hairless = cat?.hairless {
                let hairlessText: String = {
                    if hairless == 1{
                        return "Hairless: Yes"
                    } else {
                        return "Hairless: No"
                    }
                }()
                hairlessLabel.text = hairlessText
            }
            
            if let hypoallergenic = cat?.hypoallergenic {
                let hypoallergenicText: String = {
                    if hypoallergenic == 1{
                        return "Hypoallergenic: Yes"
                    } else {
                        return "Hypoallergenic: No"
                    }
                }()
                hypoallergenicLabel.text = hypoallergenicText
            }
            
            if let childFriendly = cat?.childFriendly {
                let childFriendlyText = "children: \(childFriendly)"
                childFriendlyLabel.text = childFriendlyText
            }
            
            if let dogFriendly = cat?.dogFriendly {
                let dogFriendlyText = "dogs: \(dogFriendly)"
                dogFriendlyLabel.text = dogFriendlyText
            }
            
            if let strangerFriendly = cat?.strangerFriendly {
                let strangerFriendlyText = "strangers: \(strangerFriendly)"
                strangerFriendlyLabel.text = strangerFriendlyText
            }
            
            if let origin = cat?.origin {
                let originText = "Origin: \(origin)"
                originLabel.text = originText
            }
            
            if let temperament = cat?.temperament {
                let temperamentText = "Temperament: \(temperament)"
                temperamentLabel.text = temperamentText
            }
            
            if let description = cat?.description {
                let descriptionText = "Description: \(description)"
                descriptionLabel.text = descriptionText
            }
        }
    }
    
    func setupImage() {
        if let imageUrl = cat?.imageURL {
            catImageView.loadImagesUsingUrlString(urlString: imageUrl)
        }
    }
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var catImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.backgroundColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.left", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .bold))?.withTintColor(.white).withRenderingMode(.alwaysOriginal), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame.size = CGSize(width: 50, height: 50)
        button.addTarget(self, action: #selector(goBack(_:)), for: .touchUpInside)
        return button
    }()
    
    private var breedLabel: OneCatParameterLabel = {
        let label = OneCatParameterLabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private var separatorOne = SeparatorView()
    
    private var overviewView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var weightLabel = OneCatParameterLabel()
    private var lifeSpanLabel = OneCatParameterLabel()
    private var intelliganceLabel = OneCatParameterLabel()
    private var adaptabilityLabel = OneCatParameterLabel()
    private var groomingLabel = OneCatParameterLabel()
    private var healthIssuesLabel = OneCatParameterLabel()
    private var energyLevelLabel = OneCatParameterLabel()
    private var hairlessLabel = OneCatParameterLabel()
    private var hypoallergenicLabel = OneCatParameterLabel()
    
    private var separatorTwo = SeparatorView()
    
    private var friendlyToView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    private var friendlyToLabel: OneCatParameterLabel = {
        let label = OneCatParameterLabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.text = "Friendly to:"
        return label
    }()
    
    private var childFriendlyLabel = OneCatParameterLabel()
    private var dogFriendlyLabel = OneCatParameterLabel()
    private var strangerFriendlyLabel = OneCatParameterLabel()
    
    private var separatorThree = SeparatorView()
    
    private var detailsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    private var detailsLabel: OneCatParameterLabel = {
        let label = OneCatParameterLabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.text = "Details:"
        return label
    }()
    
    private var originLabel = OneCatParameterLabel()
    private var temperamentLabel = OneCatParameterLabel()
    private var descriptionLabel = OneCatParameterLabel()
    
    private var lastSeparator = SeparatorView()
    
    @objc func goBack(_ sender: UIButton) {
        print("you clicked on button \(sender.tag)")
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        print("One cat screen has been presented \(String(describing: cat))")
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        //        breedLabel.text = "TEst Test Test"
        
        setupScrollView()
        setupContentViews()
        
        
    }
    
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    func setupContentViews() {
        
        contentView.addSubview(catImageView)
        catImageView.addSubview(backButton)
        contentView.addSubview(breedLabel)
        contentView.addSubview(separatorOne)
        contentView.addSubview(overviewView)
        overviewView.addSubview(weightLabel)
        overviewView.addSubview(lifeSpanLabel)
        overviewView.addSubview(intelliganceLabel)
        overviewView.addSubview(adaptabilityLabel)
        overviewView.addSubview(groomingLabel)
        overviewView.addSubview(healthIssuesLabel)
        overviewView.addSubview(energyLevelLabel)
        overviewView.addSubview(hairlessLabel)
        overviewView.addSubview(hypoallergenicLabel)
        contentView.addSubview(separatorTwo)
        contentView.addSubview(friendlyToView)
        friendlyToView.addSubview(friendlyToLabel)
        friendlyToView.addSubview(childFriendlyLabel)
        friendlyToView.addSubview(dogFriendlyLabel)
        friendlyToView.addSubview(strangerFriendlyLabel)
        contentView.addSubview(separatorThree)
        contentView.addSubview(detailsView)
        detailsView.addSubview(detailsLabel)
        detailsView.addSubview(originLabel)
        detailsView.addSubview(temperamentLabel)
        detailsView.addSubview(descriptionLabel)
        
        contentView.addSubview(lastSeparator)
        
        // Do any additional setup after loading the view.
        
        catImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        catImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        catImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        catImageView.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor, multiplier: 0.4).isActive = true
        
        backButton.leadingAnchor.constraint(equalTo: catImageView.leadingAnchor, constant: 20).isActive = true
        backButton.topAnchor.constraint(equalTo: catImageView.topAnchor, constant: 20).isActive = true
        
        //        breedLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        breedLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        breedLabel.topAnchor.constraint(equalTo: catImageView.bottomAnchor, constant: 25).isActive = true
        //        breedLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
        
        separatorOne.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        separatorOne.topAnchor.constraint(equalTo: breedLabel.bottomAnchor, constant: 12.5).isActive = true
        separatorOne.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
        separatorOne.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //        overviewView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        overviewView.topAnchor.constraint(equalTo: breedLabel.bottomAnchor, constant: 25).isActive = true
        //        overviewView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
        //        overviewView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        overviewView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        overviewView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 30).isActive = true
        
        weightLabel.leadingAnchor.constraint(equalTo: overviewView.leadingAnchor, constant: 0).isActive = true
        weightLabel.topAnchor.constraint(equalTo: overviewView.topAnchor, constant: 0).isActive = true
        
        lifeSpanLabel.leadingAnchor.constraint(equalTo: overviewView.leadingAnchor, constant: 0).isActive = true
        lifeSpanLabel.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 5).isActive = true
        
        intelliganceLabel.leadingAnchor.constraint(equalTo: overviewView.leadingAnchor, constant: 0).isActive = true
        intelliganceLabel.topAnchor.constraint(equalTo: lifeSpanLabel.bottomAnchor, constant: 5).isActive = true
        
        adaptabilityLabel.leadingAnchor.constraint(equalTo: overviewView.leadingAnchor, constant: 0).isActive = true
        adaptabilityLabel.topAnchor.constraint(equalTo: intelliganceLabel.bottomAnchor, constant: 5).isActive = true
        
        groomingLabel.leadingAnchor.constraint(equalTo: overviewView.leadingAnchor, constant: 0).isActive = true
        groomingLabel.topAnchor.constraint(equalTo: adaptabilityLabel.bottomAnchor, constant: 5).isActive = true
        
        healthIssuesLabel.leadingAnchor.constraint(equalTo: overviewView.leadingAnchor, constant: 0).isActive = true
        healthIssuesLabel.topAnchor.constraint(equalTo: groomingLabel.bottomAnchor, constant: 5).isActive = true
        
        energyLevelLabel.leadingAnchor.constraint(equalTo: overviewView.leadingAnchor, constant: 0).isActive = true
        energyLevelLabel.topAnchor.constraint(equalTo: healthIssuesLabel.bottomAnchor, constant: 5).isActive = true
        
        hairlessLabel.leadingAnchor.constraint(equalTo: overviewView.leadingAnchor, constant: 0).isActive = true
        hairlessLabel.topAnchor.constraint(equalTo: energyLevelLabel.bottomAnchor, constant: 5).isActive = true
        
        hypoallergenicLabel.leadingAnchor.constraint(equalTo: overviewView.leadingAnchor, constant: 0).isActive = true
        hypoallergenicLabel.topAnchor.constraint(equalTo: hairlessLabel.bottomAnchor, constant: 5).isActive = true
        
        separatorTwo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        separatorTwo.topAnchor.constraint(equalTo: hypoallergenicLabel.bottomAnchor, constant: 7.5).isActive = true
        separatorTwo.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
        separatorTwo.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        friendlyToView.topAnchor.constraint(equalTo: separatorTwo.bottomAnchor, constant: 7.5).isActive = true
        friendlyToView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        friendlyToView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20).isActive = true
        
        friendlyToLabel.leadingAnchor.constraint(equalTo: friendlyToView.leadingAnchor, constant: 0).isActive = true
        friendlyToLabel.topAnchor.constraint(equalTo: friendlyToView.topAnchor, constant: 0).isActive = true
        
        childFriendlyLabel.leadingAnchor.constraint(equalTo: friendlyToView.leadingAnchor, constant: 10).isActive = true
        childFriendlyLabel.topAnchor.constraint(equalTo: friendlyToLabel.bottomAnchor, constant: 10).isActive = true
        
        dogFriendlyLabel.leadingAnchor.constraint(equalTo: friendlyToView.leadingAnchor, constant: 10).isActive = true
        dogFriendlyLabel.topAnchor.constraint(equalTo: childFriendlyLabel.bottomAnchor, constant: 10).isActive = true
        
        strangerFriendlyLabel.leadingAnchor.constraint(equalTo: friendlyToView.leadingAnchor, constant: 10).isActive = true
        strangerFriendlyLabel.topAnchor.constraint(equalTo: dogFriendlyLabel.bottomAnchor, constant: 10).isActive = true
        
        separatorThree.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        separatorThree.topAnchor.constraint(equalTo: strangerFriendlyLabel.bottomAnchor, constant: 7.5).isActive = true
        separatorThree.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
        separatorThree.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        detailsView.topAnchor.constraint(equalTo: separatorThree.bottomAnchor, constant: 7.5).isActive = true
        detailsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        detailsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20).isActive = true
        
        detailsLabel.leadingAnchor.constraint(equalTo: detailsView.leadingAnchor, constant: 0).isActive = true
        detailsLabel.topAnchor.constraint(equalTo: detailsView.topAnchor, constant: 0).isActive = true
        
        originLabel.leadingAnchor.constraint(equalTo: detailsView.leadingAnchor, constant: 10).isActive = true
        originLabel.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 10).isActive = true
        
        temperamentLabel.leadingAnchor.constraint(equalTo: detailsView.leadingAnchor, constant: 10).isActive = true
        temperamentLabel.trailingAnchor.constraint(equalTo: detailsView.trailingAnchor, constant: -20).isActive = true
        temperamentLabel.topAnchor.constraint(equalTo: originLabel.bottomAnchor, constant: 10).isActive = true
        
        descriptionLabel.leadingAnchor.constraint(equalTo: detailsView.leadingAnchor, constant: 10).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: detailsView.trailingAnchor, constant: -30).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: temperamentLabel.bottomAnchor, constant: 10).isActive = true
        
        
        lastSeparator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        lastSeparator.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 7.5).isActive = true
        lastSeparator.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
        lastSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lastSeparator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
