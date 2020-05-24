//
//  ViewController.swift
//  UltimateCat
//
//  Created by DiMa on 05/05/2020.
//  Copyright © 2020 DiMa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let searchBar = UISearchBar()
    
    private var catsCollectionView = CatsCollectionView()
    
    private let notificationCenter = NotificationCenter.default
    
    var catsManager = CatsManager()
    var imageManager = ImageManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.sizeToFit()
        searchBar.delegate = self
        
        self.modalPresentationStyle = .overFullScreen
        self.view.backgroundColor = UIColor.systemBackground
        
        notificationCenter.addObserver(self, selector: #selector(presentOneCatVC(_:)), name: NSNotification.Name ("com.user.login.success"), object: nil)
        
        catsManager.delegate = self
        imageManager.delegate = self
        
        catsManager.fetchCats()
        
        view.addSubview(catsCollectionView)
        
        catsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        catsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        catsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        catsCollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        catsCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
//        catsCollectionView.heightAnchor.constraint(equalToConstant: 600).isActive = true
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        catsCollectionView.configureCollectionViewLayoutItemSize()
    }
    
    @objc func presentOneCatVC(_ notification: Notification){
        let oneCatVC = OneCatViewController()
        oneCatVC.modalPresentationStyle = .fullScreen
        //        present(oneCatVC, animated: true, completion: nil)
        present(oneCatVC, animated: true) {
            oneCatVC.cat = notification.userInfo?["userInfo"] as! ImageModel
        }
        print(notification.userInfo?["userInfo"] ?? [:])
    }
    
}

extension ViewController: CatsManagerDelegate{
    func didUpdateCats(_ catsManager: CatsManager, cats: [CatsModel]) {
        DispatchQueue.global().async {
            self.catsCollectionView.set(cells: cats)
            print("cats set")
            for cat in self.catsCollectionView.cells{
                print(cat.id)
                self.imageManager.fetchImage(for: cat.id)
            }
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}

extension ViewController: ImageManagerDelegate{
    func didUpdateImage(_ imageManager: ImageManager, image: ImageModel) {
        DispatchQueue.main.async {
            self.catsCollectionView.setWithImages(picture: image)
            print("image Delegate")
        }
    }
}
