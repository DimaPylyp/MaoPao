////
////  OneCatScreenPhotoImageView.swift
////  UltimateCat
////
////  Created by DiMa on 24/05/2020.
////  Copyright © 2020 DiMa. All rights reserved.
////
//
//import UIKit
//
//protocol ButtonDelegate: class {
//  func buttonTapped(button: UIButton)
//}
//
//class OneCatScreenPhotoImageView: UIImageView {
//
//    weak var delegate: ButtonDelegate?
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        addSubview(button2)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
////    lazy var button2: UIButton = {
////      let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
////      button2.backgroundColor = .red
////      button2.setTitle("Delete", for: .normal)
////      button2.tag = 23
////      button2.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
////      return button
////    }()
//
//    @objc func buttonAction(sender: UIButton) {
//      guard let delegate = delegate else { return }
//      delegate.buttonTapped(button: sender)
//    }
//}
