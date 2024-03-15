////
////  add.swift
////  KinopoiskCloneAPI
////
////  Created by Николай Гринько on 13.10.2023.
////
//
//import Foundation
//import UIKit
//
//class ProfileViewController: UIViewController, UIScrollViewDelegate {
// 
//     private lazy var  scrollView: UIScrollView = {
//        let scrollView = UIScrollView()
//        scrollView.contentSize = CGSize(width: view.bounds.width, height: 2000)
//        scrollView.backgroundColor = .gray
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        return scrollView
//    }()
//    
////    private lazy var contentView: UIView = {
////        let view = UIView()
////        view.backgroundColor = UIColor.gray
////        view.translatesAutoresizingMaskIntoConstraints = false
////        return view
////    }()
//    
//    let containerView: UIView = {
//        let container = UIView()
//        //container.frame = CGRect(x: 10, y: 0, width: 380, height: 400)
//        container.translatesAutoresizingMaskIntoConstraints = false
//        container.backgroundColor = .secondarySystemBackground
//        container.layer.cornerRadius = 10
//        return container
//    }()
//    
//    let containerView2: UIView = {
//        let container = UIView()
//        //container.frame = CGRect(x: 10, y: 0, width: 380, height: 400)
//        container.translatesAutoresizingMaskIntoConstraints = false
//        container.backgroundColor = .blue
//        container.layer.cornerRadius = 10
//        return container
//    }()
//    
//    private let myImageAvat: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(systemName: "person")
//        imageView.contentMode = .center
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        //imageView.frame = CGRect(x: 145, y: 70, width: 80, height: 80)
//        imageView.layer.cornerRadius = 40
//        imageView.layer.masksToBounds = true
//        let borderColor = UIColor(red: 230/255, green: 135/255, blue: 100/255, alpha: 1)
//        imageView.layer.borderColor = borderColor.cgColor
//        imageView.layer.borderWidth = 5
//        return imageView
//    }()
//    
//    private let nameAvatar: UILabel = {
//        let nameAvatar = UILabel()
//        nameAvatar.text = "Гринько Николай"
//        nameAvatar.translatesAutoresizingMaskIntoConstraints = false
//        //nameAvatar.frame = CGRect(x: 110, y: 160, width: 180, height: 20)
//        nameAvatar.font = .boldSystemFont(ofSize: 18)
//        nameAvatar.textColor = .white
//        return nameAvatar
//    }()
//    
//    private let nameUrlAvatar: UILabel = {
//        let nameUrlAvatar = UILabel()
//        nameUrlAvatar.text = "grinkonikolka@yandex.ru"
//        nameUrlAvatar.translatesAutoresizingMaskIntoConstraints = false
//        //nameUrlAvatar.frame = CGRect(x: 110, y: 190, width: 180, height: 20)
//        nameUrlAvatar.font = .boldSystemFont(ofSize: 12)
//        nameUrlAvatar.textColor = .lightGray
//        return nameUrlAvatar
//    }()
//    
//    private let imageBabyAvatar: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "baby")
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .center
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.frame = CGRect(x: 20, y: 220, width: 40, height: 40)
//        imageView.layer.cornerRadius = 20
//        imageView.layer.masksToBounds = true
////        let borderColor = UIColor(red: 230/255, green: 135/255, blue: 100/255, alpha: 1)
////        imageView.layer.borderColor = borderColor.cgColor
////        imageView.layer.borderWidth = 5
//        return imageView
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//       // title = "Профиль"
//       // view = scrollView
//       scrollView.delegate = self
//        view.addSubview(scrollView)
//        scrollView.addSubview(containerView)
//        scrollView.addSubview(containerView2)
////        contentView.addSubview(containerView)
////        contentView.addSubview(containerView2)
//        containerView.addSubview(myImageAvat)
//        containerView.addSubview(nameAvatar)
//        containerView.addSubview(nameUrlAvatar)
////        containerView.addSubview(imageBabyAvatar)
//        
//        view.backgroundColor = .systemBackground
//        constraints()
//    }
//    
//    
//    private func constraints() {
//        
//        NSLayoutConstraint.activate([
//
//            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
//            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            //scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
//            scrollView.heightAnchor.constraint(equalToConstant: 2000),
//            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            
////            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
////            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
////            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
////            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
////            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
//            
//            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
//            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
//            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
//            containerView.heightAnchor.constraint(equalToConstant: 400),
//            
//            
//            containerView2.topAnchor.constraint(equalTo: containerView.bottomAnchor),
//            containerView2.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
//            containerView2.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
//            containerView2.heightAnchor.constraint(equalToConstant: 1000),
//       
//            
//            myImageAvat.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 30),
//            myImageAvat.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
//            myImageAvat.widthAnchor.constraint(equalToConstant: 80),
//            myImageAvat.heightAnchor.constraint(equalToConstant: 80),
//            
//            nameAvatar.topAnchor.constraint(equalTo: myImageAvat.bottomAnchor, constant: 20),
//            nameAvatar.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
//            nameAvatar.widthAnchor.constraint(equalToConstant: 160),
//            nameAvatar.heightAnchor.constraint(equalToConstant: 20),
//            
//            nameUrlAvatar.topAnchor.constraint(equalTo: nameAvatar.bottomAnchor, constant: 10),
//            nameUrlAvatar.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
//            nameUrlAvatar.widthAnchor.constraint(equalToConstant: 160),
//            nameUrlAvatar.heightAnchor.constraint(equalToConstant: 20),
//            
//        ])
//    }
//    
//}
//
