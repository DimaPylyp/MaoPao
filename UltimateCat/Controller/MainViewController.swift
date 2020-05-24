//
//  MainViewController.swift
//  UltimateCat
//
//  Created by DiMa on 24/05/2020.
//  Copyright © 2020 DiMa. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let searchBar = UISearchBar()
    
    let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame.size = CGSize(width: 83, height: 77)
        imageView.image = UIImage(named:K.arrowUpImageName)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let searchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame.size = CGSize(width: 169, height: 94)
        imageView.image = UIImage(named:K.searchImageName)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let orImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame.size = CGSize(width: 169, height: 94)
        imageView.image = UIImage(named:K.orImageName)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let pickButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: K.pickImageName), for: .normal)
        button.frame.size = CGSize(width: 217, height: 100)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(tapPick(_:)), for: .touchUpInside)
        return button
    }()
    
    let catsCollectionViewController = CatsCollectionViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        catsCollectionViewController.viewDidLoad()
        
        let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.singleTap(sender:)))
        singleTapGestureRecognizer.numberOfTapsRequired = 1
        singleTapGestureRecognizer.isEnabled = true
        singleTapGestureRecognizer.cancelsTouchesInView = false
        self.view.addGestureRecognizer(singleTapGestureRecognizer)
        
        view.addSubview(searchBar)
        view.addSubview(arrowImageView)
        view.addSubview(searchImageView)
        view.addSubview(orImageView)
        view.addSubview(pickButton)
        
        setupSearchBar()
        
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        searchBar.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        arrowImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        arrowImageView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 40).isActive = true
        
        searchImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchImageView.topAnchor.constraint(equalTo: arrowImageView.bottomAnchor, constant: 10).isActive = true
        
        orImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        orImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        pickButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -140).isActive = true
        pickButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
    }
    
    @objc func tapPick(_ sender: UIButton) {
       
        catsCollectionViewController.modalPresentationStyle = .fullScreen
        present(catsCollectionViewController, animated: true) {
            self.catsCollectionViewController.catsCollectionView.scrollToItem(at:[0, 0], at: .centeredHorizontally, animated: true)

        }
        
      print("you clicked on button \(sender.tag)")
    }
    
    @objc func singleTap(sender: UITapGestureRecognizer) {
        self.searchBar.resignFirstResponder()
    }
    
    @objc func handleShowSearchBar() {
        searchBar.becomeFirstResponder()
        search(shouldShow: true)
    }
    
    func setupSearchBar() {
        view.backgroundColor = UIColor(red: 0.8392156862745098, green: 0.6352941176470588, blue: 0.9098039215686274, alpha: 1.0)
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.textColor = .black
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.sizeToFit()
        searchBar.delegate = self
    }
    
    func search(shouldShow: Bool) {
        searchBar.showsCancelButton = shouldShow
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("Search bar editing did begin..")
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("Search bar editing did end..")
    }
    
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        search(shouldShow: false)
//        searchBar.endEditing(true)
//    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
//        var catId = ""
        var indexPathRow = 0
        for cat in catsCollectionViewController.catsCollectionView.cells{
            if cat.breed == searchBar.searchTextField.text{
//                catId = cat.id
//                print("\(catId)")
                
                catsCollectionViewController.modalPresentationStyle = .fullScreen
//                catsCollectionViewController.catsCollectionView.cellsWithImages.removeAll()
//                catsCollectionViewController.imageManager.fetchImage(for: catId)
                present(catsCollectionViewController, animated: true){
                    print(indexPathRow)
                    self.catsCollectionViewController.catsCollectionView.scrollToItem(at:[0, indexPathRow], at: .centeredHorizontally, animated: true)
                }
                break
            }
            indexPathRow += 1
        }
        if indexPathRow == catsCollectionViewController.catsCollectionView.cells.count{
            searchBar.text = ""
            searchBar.placeholder = "Try Again"
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Search text is \(searchText)")
    }
}
