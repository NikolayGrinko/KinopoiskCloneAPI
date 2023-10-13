//
//  ProfileViewController.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 11.10.2023.
//

import UIKit

class ProfileViewController: UIViewController {
 
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let containerView: UIView = {
        let container = UIView()
        //container.frame = CGRect(x: 10, y: 0, width: 380, height: 400)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .secondarySystemBackground
        container.layer.cornerRadius = 10
        return container
    }()
    
    private let myImageAvat: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        imageView.contentMode = .center
        imageView.frame = CGRect(x: 145, y: 70, width: 80, height: 80)
        imageView.layer.cornerRadius = 40
        imageView.layer.masksToBounds = true
        let borderColor = UIColor(red: 230/255, green: 135/255, blue: 100/255, alpha: 1)
        imageView.layer.borderColor = borderColor.cgColor
        imageView.layer.borderWidth = 5
        return imageView
    }()
    
    private let nameAvatar: UILabel = {
        let nameAvatar = UILabel()
        nameAvatar.text = "Гринько Николай"
        nameAvatar.frame = CGRect(x: 110, y: 160, width: 180, height: 20)
        nameAvatar.font = .boldSystemFont(ofSize: 18)
        nameAvatar.textColor = .white
        return nameAvatar
    }()
    
    private let nameUrlAvatar: UILabel = {
        let nameAvatar = UILabel()
        nameAvatar.text = "grinkonikolka@yandex.ru"
        nameAvatar.frame = CGRect(x: 110, y: 190, width: 180, height: 20)
        nameAvatar.font = .boldSystemFont(ofSize: 12)
        nameAvatar.textColor = .lightGray
        return nameAvatar
    }()
    
    private let imageBabyAvatar: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "baby")
        imageView.contentMode = .center
        imageView.frame = CGRect(x: 20, y: 220, width: 40, height: 40)
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
//        let borderColor = UIColor(red: 230/255, green: 135/255, blue: 100/255, alpha: 1)
//        imageView.layer.borderColor = borderColor.cgColor
//        imageView.layer.borderWidth = 5
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // title = "Профиль"
        
        view.addSubview(scrollView)
       
          scrollView.addSubview(contentView)
        contentView.addSubview(containerView)
//        containerView.addSubview(myImageAvat)
//        containerView.addSubview(nameAvatar)
//        containerView.addSubview(nameUrlAvatar)
//        containerView.addSubview(imageBabyAvatar)
        
        view.backgroundColor = .systemBackground
        constraints()
    }
    
    private func constraints() {
        
        NSLayoutConstraint.activate([

            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            containerView.heightAnchor.constraint(equalToConstant: 400),
            
        ])
    }
    
}

