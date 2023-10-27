//
//  MyMoviesBabyController.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 27.10.2023.
//

import UIKit

class MyMoviesBabyController: UIViewController {
    
    private let nameLabel: UILabel = {
        let nameAvatar = UILabel()
        nameAvatar.text = "Мое"
        nameAvatar.frame = CGRect(x: 10, y: 50, width: 100, height: 40)
        nameAvatar.numberOfLines = 0
        nameAvatar.textAlignment = .center
        nameAvatar.font = .systemFont(ofSize: 30, weight: .bold)
        nameAvatar.textColor = .black
        return nameAvatar
    }()
    
    private let myImageGradient: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "smeh4")
        imageView.layer.cornerRadius = 50
        //imageView.contentMode = .center
        imageView.frame = CGRect(x: 120, y: 150, width: 140, height: 140)
        imageView.layer.cornerRadius = 70
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let nameAvatarLabel: UILabel = {
        let nameAvatar = UILabel()
        nameAvatar.text = "Здесь будет храниться загруженное и купленное кино для детей"
        nameAvatar.frame = CGRect(x: 30, y: 320, width: 320, height: 90)
        nameAvatar.numberOfLines = 0
        nameAvatar.textAlignment = .center
        nameAvatar.font = .boldSystemFont(ofSize: 24)
        nameAvatar.textColor = .black
        return nameAvatar
    }()
    
    
    private let nameAvatarLabel1: UILabel = {
        let nameAvatar = UILabel()
        nameAvatar.text = "Загружать и покупать можно только в профиле взрослого"
        nameAvatar.numberOfLines = 0
        nameAvatar.textAlignment = .center
        nameAvatar.frame = CGRect(x: 30, y: 420, width: 300, height: 50)
        nameAvatar.font = .boldSystemFont(ofSize: 18)
        nameAvatar.textColor = .lightGray
        return nameAvatar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.isTranslucent = false
        
        view.backgroundColor = .white
       
        view.addSubview(myImageGradient)
        view.addSubview(nameAvatarLabel)
        view.addSubview(nameAvatarLabel1)
        view.addSubview(nameLabel)
        
    }
}
