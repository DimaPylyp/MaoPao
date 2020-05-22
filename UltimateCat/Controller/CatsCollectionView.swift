//
//  CatsCollectionView.swift
//  UltimateCat
//
//  Created by DiMa on 19/05/2020.
//  Copyright © 2020 DiMa. All rights reserved.
//

import UIKit

class CatsCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var cells = [CatsModel]()
    var images = [UIImage]()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .white
        delegate = self
        dataSource = self
        register(CatsCollectionViewCell.self, forCellWithReuseIdentifier: CatsCollectionViewCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = 10
        contentInset = UIEdgeInsets(top: 0, left: Constants.leftDistanceToView, bottom: 0, right: Constants.rightDistanceToView)
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }
    
    func set(cells: [CatsModel]) {
        self.cells = cells
        print("set function worked \(cells.count)")
    }
    
    func setWithImages(picture: [ImageModel]) {
        print("picture is \(picture)")
        let imageURL = picture[0].imageURL
        print("in the function \(imageURL)")
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: URL(string:imageURL)!) {
                print(data)
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self!.images.append(image)
                    }
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print ("\(images.count) created cells")
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: CatsCollectionViewCell.reuseId, for: indexPath) as! CatsCollectionViewCell
        //        cell.mainImageView.image = UIImage(named: "meme-template-zoom-background-9")
        cell.mainImageView.image = images[indexPath.row]
//        print(cells[indexPath.row].breed)
//        cell.breedLabel.text = cells[indexPath.row].breed
//        //        cell.weightLabel.text = cells[indexPath.row].weigth + "kg"
//        cell.lifeSpanLabel.text = cells[indexPath.row].lifeSpan
//        cell.inteleganceLabel.text = String(cells[indexPath.row].intelligence)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.CatsItemWidth, height: frame.height * 0.8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}

//extension CatsCollectionView: CatsManagerDelegate{
//    func didUpdateCats(_ catsManager: CatsManager, cats: [CatsModel]) {
////        DispatchQueue.main.async {
//            self.cells = cats
////        }
//    }
//
//    func didFailWithError(_ error: Error) {
//        print(error)
//    }
//
//
//}
