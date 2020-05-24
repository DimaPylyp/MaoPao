//
//  ViewController.swift
//  UltimateCat
//
//  Created by DiMa on 05/05/2020.
//  Copyright © 2020 DiMa. All rights reserved.
//

import UIKit

class CatsCollectionViewController: UIViewController {
    
    var catsCollectionView = CatsCollectionView()
    
    private let notificationCenter = NotificationCenter.default
    
    var catsManager = CatsManager()
    var imageManager = CatManager()
    
    private var backButton: BackButton = {
        let button = BackButton()
        button.addTarget(self, action: #selector(goBack(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.modalPresentationStyle = .overFullScreen
        self.view.backgroundColor = UIColor.systemBackground
        
        notificationCenter.addObserver(self, selector: #selector(presentOneCatVC(_:)), name: NSNotification.Name ("cat selected"), object: nil)
        
        catsManager.delegate = self
        imageManager.delegate = self
        
        catsManager.fetchCats()
        
        view.addSubview(catsCollectionView)
        view.addSubview(backButton)
        
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        
        catsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        catsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        catsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        catsCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        catsCollectionView.configureCollectionViewLayoutItemSize()
    }
    
    @objc func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func presentOneCatVC(_ notification: Notification){
        let oneCatVC = OneCatViewController()
        oneCatVC.modalPresentationStyle = .fullScreen
        //        present(oneCatVC, animated: true, completion: nil)
        present(oneCatVC, animated: true) {
            oneCatVC.cat = (notification.userInfo?["userInfo"] as! CatModel)
        }
    }
}

extension CatsCollectionViewController: CatsManagerDelegate{
    func didUpdateCats(_ catsManager: CatsManager, cats: [CatsModel]) {
        DispatchQueue.global().async {
            self.catsCollectionView.set(cells: cats)
            for cat in self.catsCollectionView.cells{
                self.imageManager.fetchImage(for: cat.id)
            }
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}

extension CatsCollectionViewController: CatManagerDelegate{
    func didUpdateImage(_ imageManager: CatManager, image: CatModel) {
        DispatchQueue.main.async {
            self.catsCollectionView.setWithImages(picture: image)
        }
    }
}
