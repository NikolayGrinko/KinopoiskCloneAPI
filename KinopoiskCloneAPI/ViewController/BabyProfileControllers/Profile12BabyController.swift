//
//  Profile12+Baby.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 27.10.2023.
//

import UIKit

class Profile12BabyController: UIViewController {
    
    private let mySmehImageBaby: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "babyMax2")
        imageView.layer.cornerRadius = 50
        imageView.layer.masksToBounds = false
        imageView.layer.shadowRadius = 5
        let borderColor = UIColor(red: 187/270, green: 24/270, blue: 255/270, alpha: 1)
        imageView.layer.borderColor = borderColor.cgColor
        imageView.layer.borderWidth = 5
        imageView.frame = CGRect(x: 150, y: 80, width: 100, height: 100)

        return imageView
    }()
    
    private let babyLabel: UILabel = {
        let nameAvatar = UILabel()
        nameAvatar.text = "Дети"
        nameAvatar.frame = CGRect(x: 170, y: 210, width: 60, height: 20)
        nameAvatar.numberOfLines = 0
        nameAvatar.textAlignment = .center
        nameAvatar.font = .systemFont(ofSize: 24, weight: .bold)
        nameAvatar.textColor = .black
        return nameAvatar
    }()
    
    private let ageLabel: UILabel = {
        let nameAvatar = UILabel()
        nameAvatar.text = "12+"
        nameAvatar.frame = CGRect(x: 180, y: 240, width: 30, height: 20)
        nameAvatar.numberOfLines = 0
        nameAvatar.textAlignment = .center
        nameAvatar.font = .boldSystemFont(ofSize: 12)
        nameAvatar.textColor = .systemGray
        return nameAvatar
    }()
    
    lazy var oneButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        //configuration.image = UIImage(systemName: "play.fill")
        // между контентом
       // configuration.imagePadding = 10
        //configuration.imagePlacement = .leading
        configuration.titleAlignment = .center
        configuration.baseBackgroundColor = .orange
        configuration.attributedTitle = AttributedString("Выйти", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(white: 230/120, alpha: 1)]))
        configuration.buttonSize = .large
        configuration.contentInsets = .init(top: 5, leading: 10, bottom: 5, trailing: 10)
        configuration.cornerStyle = .capsule
        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { action in
          //debugPrint("Tapped One Button!")
        }))
        button.frame = CGRect(x: 90, y: 300, width: 220, height: 50)
        button.addTarget(self, action: #selector(tapNextProfile), for: .touchUpInside)
        return button
    }()
    
    @objc private func tapNextProfile() {
        
        let window = SceneDelegate.window
        window?.rootViewController = TabBarController()
        window?.makeKeyAndVisible()
        
//        let tabBarVC = TabBarController()
//        tabBarVC.modalPresentationStyle = .fullScreen
//        self.navigationController?.pushViewController(tabBarVC, animated: true)
//        
//        self.dismiss(animated: false)
//        self.removeFromParent()
    }
    
    private let mySmehImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "smeh6")
        imageView.layer.cornerRadius = 50
        //imageView.contentMode = .center
        imageView.frame = CGRect(x: 130, y: 450, width: 130, height: 130)
        imageView.layer.cornerRadius = 70
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let nameAvatarLabel: UILabel = {
        let nameAvatar = UILabel()
        let text = " "
        nameAvatar.text = "Менять настройки могут \(text) \(text) только взрослые"
        nameAvatar.frame = CGRect(x: 60, y: 600, width: 290, height: 80)
        nameAvatar.numberOfLines = 0
        nameAvatar.textAlignment = .center
        nameAvatar.font = .boldSystemFont(ofSize: 22)
        nameAvatar.textColor = .black
        return nameAvatar
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationController?.navigationBar.isHidden = false
        
        view.addSubview(mySmehImageBaby)
        view.addSubview(babyLabel)
        view.addSubview(ageLabel)
        view.addSubview(oneButton)
        view.addSubview(mySmehImage)
        view.addSubview(nameAvatarLabel)
        
    }
    
}

