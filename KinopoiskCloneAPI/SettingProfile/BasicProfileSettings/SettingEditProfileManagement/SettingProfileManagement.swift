//
//  SettingProfileManagement.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 26.10.2023.
//

import UIKit


class SettingProfileManagement: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Управление профилем"
        //label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    lazy var babyButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(named: "baby2")
        //configuration.imageColorTransformer = .preferredTint
        configuration.baseBackgroundColor = .tintColor
        // между контентом
        configuration.imagePadding = 10
        
        configuration.imagePlacement = .leading
        configuration.titleAlignment = .trailing
        configuration.baseBackgroundColor = .black
        configuration.attributedTitle = AttributedString("Дети  12+", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(white: 230/120, alpha: 1)]))
        configuration.buttonSize = .large
        configuration.contentInsets = .init(top: 5, leading: 10, bottom: 5, trailing: 10)
        configuration.cornerStyle = .large
        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { action in
          //debugPrint("Tapped One Button!")
        }))
        button.addTarget(self, action: #selector(tapSettingBabyProfile), for: .touchUpInside)
        return button
    }()
    
    @objc private func tapSettingBabyProfile() {
        
        let vc = SettingBabyProfile()
        present(vc, animated: true)
    }
    
    private lazy var banButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.imagePadding = 10
        configuration.imagePlacement = .leading
        configuration.titleAlignment = .trailing
        configuration.baseBackgroundColor = .tertiarySystemFill
        configuration.attributedTitle = AttributedString("Запретить", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(white: 230/120, alpha: 1)]))
        configuration.buttonSize = .medium
        configuration.contentInsets = .init(top: 5, leading: 10, bottom: 5, trailing: 10)
        configuration.cornerStyle = .capsule
        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { action in
        }))
        //button.frame = CGRect(x: 250, y: 200, width: 120, height: 35)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()

    private let imageSettingBaby: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "pencil")
        imageView.frame = CGRect(x: 35, y: 120, width: 40, height: 40)
        imageView.tintColor = .white
        //imageView.contentMode = .center
        //imageView.translatesAutoresizingMaskIntoConstraints = false
       // imageView.layer.masksToBounds = true
        return imageView
    }()
   
    
    @objc private func tapButton() {
        print("Запретить")
        
        //MARK: Modal VC
        let vc = BanTapSettingProfile()
        present(vc, animated: true)
        
    }
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = .systemGray
        
        button.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        return button
    }()
    
    @objc func dismissAlert() {
        self.dismiss(animated: false)
        self.removeFromParent()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //title = "Управление профилями"
        view.addSubview(titleLabel)
        view.addSubview(closeButton)
        view.addSubview(babyButton)
        view.addSubview(banButton)
        view.addSubview(imageSettingBaby)
        
        //navigationItem.title = "Управление профилями"
        view.backgroundColor = .black
        
        constraints()
        
    }
    
    private func constraints() {
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        babyButton.translatesAutoresizingMaskIntoConstraints = false
        banButton.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        //imageSettingBaby.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            titleLabel.widthAnchor.constraint(equalToConstant: 220),
            
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            closeButton.heightAnchor.constraint(equalToConstant: 70),
            closeButton.widthAnchor.constraint(equalToConstant: 60),
            
         
            babyButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            babyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            babyButton.heightAnchor.constraint(equalToConstant: 80),
            babyButton.widthAnchor.constraint(equalToConstant: 140),
            
            
            banButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            banButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            banButton.heightAnchor.constraint(equalToConstant: 50),
            banButton.widthAnchor.constraint(equalToConstant: 150),
            
//            imageSettingBaby.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
//            imageSettingBaby.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
//            imageSettingBaby.heightAnchor.constraint(equalToConstant: 50),
//            imageSettingBaby.widthAnchor.constraint(equalToConstant: 50),
            
        ])
    }
}
