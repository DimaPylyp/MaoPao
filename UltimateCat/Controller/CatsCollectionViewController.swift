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
    var imageManager = ImageManager()
    
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
        print("you clicked on button \(sender.tag)")
        self.dismiss(animated: true, completion: nil)
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

extension CatsCollectionViewController: CatsManagerDelegate{
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

extension CatsCollectionViewController: ImageManagerDelegate{
    func didUpdateImage(_ imageManager: ImageManager, image: ImageModel) {
        DispatchQueue.main.async {
            self.catsCollectionView.setWithImages(picture: image)
            print("image Delegate")
        }
    }
}
