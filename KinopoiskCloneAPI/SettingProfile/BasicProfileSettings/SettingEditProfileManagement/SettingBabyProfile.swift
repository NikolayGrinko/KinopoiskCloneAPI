//
//  SettingBabyProfile.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 26.10.2023.
//

import UIKit

class SettingBabyProfile: UIViewController {
    
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
    
    private let titleSettingLabel: UILabel = {
        let label = UILabel()
        label.text = "Настройки"
        //label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 28, weight: .bold)
        return label
    }()
    
    private let imageSettingBaby: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "babyMax")
        imageView.frame = CGRect(x: 35, y: 120, width: 40, height: 40)
        imageView.tintColor = .black
        //imageView.contentMode = .center
        //imageView.translatesAutoresizingMaskIntoConstraints = false
       // imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let titleBabyLabel: UILabel = {
        let label = UILabel()
        label.text = "Дети"
        //label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let cinemaSettingLabel: UILabel = {
        let label = UILabel()
        label.text = "Какое кино показываем"
        //label.textAlignment = .center
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private let ageSettingLabel: UILabel = {
        let label = UILabel()
        label.text = "0+, 6+, 12+"
        //label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()

    
    
    lazy var readyButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.titleAlignment = .center
        configuration.baseBackgroundColor = UIColor(red: 220/230, green: 217/230, blue: 208/230, alpha: 1)
        configuration.attributedTitle = AttributedString("Изменить", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(red: 8/230, green: 8/230, blue: 8/230, alpha: 1)]))
        configuration.buttonSize = .large
        configuration.contentInsets = .init(top: 5, leading: 10, bottom: 5, trailing: 10)
        configuration.cornerStyle = .capsule
        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { action in
          //debugPrint("Tapped One Button!")
        }))
        button.addTarget(self, action: #selector(tapReady), for: .touchUpInside)
        return button
    }()
    
    @objc private func tapReady() {
//        dismissAlert()
    }
    
    
    lazy var cancellationButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(named: "basket")
        // между контентом
      
        
        configuration.imagePlacement = .leading
        // между контентом
        // basket
        configuration.imagePadding = 10
        configuration.titleAlignment = .trailing
        configuration.baseBackgroundColor = UIColor(red: 217/230, green: 215/230, blue: 212/230, alpha: 1)
        configuration.attributedTitle = AttributedString("Сбросить профиль", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(ciColor: .black)]))
        configuration.buttonSize = .large
        configuration.contentInsets = .init(top: 5, leading: 10, bottom: 5, trailing: 10)
        configuration.cornerStyle = .capsule
        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { action in
          //debugPrint("Tapped One Button!")
            
        }))
        button.addTarget(self, action: #selector(tapCancellation1), for: .touchUpInside)
        return button
    }()
    
    @objc private func tapCancellation1() {
        let alert = UIAlertController(title: nil, message: "Сбросить профиль дети? Вместе с ним пропадает вся история просмотра", preferredStyle: .actionSheet)
        let camBth = UIAlertAction(title: "Да, сбросить", style: .destructive, handler: nil)
        
        
        let cancel = UIAlertAction(title: "Нет, оставить", style: .cancel, handler: nil)
        
        alert.addAction(camBth)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    private lazy var banButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.imagePadding = 10
        configuration.imagePlacement = .leading
        configuration.titleAlignment = .trailing
        configuration.baseBackgroundColor = .orange
        configuration.attributedTitle = AttributedString("Сохранить", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(white: 230/120, alpha: 1)]))
        configuration.buttonSize = .medium
        configuration.contentInsets = .init(top: 5, leading: 10, bottom: 5, trailing: 10)
        configuration.cornerStyle = .capsule
        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { action in
        }))
        button.addTarget(self, action: #selector(tapCancellation), for: .touchUpInside)
        return button
    }()
    
    @objc private func tapCancellation() {
        dismissAlert()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(closeButton)
        view.addSubview(titleSettingLabel)
        view.addSubview(imageSettingBaby)
        view.addSubview(titleBabyLabel)
        view.addSubview(cinemaSettingLabel)
        view.addSubview(ageSettingLabel)
        view.addSubview(readyButton)
        view.addSubview(cancellationButton)
        view.addSubview(banButton)
    
    constraints()
    
}

    
private func constraints() {
    
    closeButton.translatesAutoresizingMaskIntoConstraints = false
    titleSettingLabel.translatesAutoresizingMaskIntoConstraints = false
    imageSettingBaby.translatesAutoresizingMaskIntoConstraints = false
    titleBabyLabel.translatesAutoresizingMaskIntoConstraints = false
    cinemaSettingLabel.translatesAutoresizingMaskIntoConstraints = false
    
    ageSettingLabel.translatesAutoresizingMaskIntoConstraints = false
    readyButton.translatesAutoresizingMaskIntoConstraints = false
    cancellationButton.translatesAutoresizingMaskIntoConstraints = false
    banButton.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
        
        closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
        closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        closeButton.heightAnchor.constraint(equalToConstant: 70),
        closeButton.widthAnchor.constraint(equalToConstant: 60),
        
        titleSettingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
        titleSettingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        titleSettingLabel.heightAnchor.constraint(equalToConstant: 30),
        titleSettingLabel.widthAnchor.constraint(equalToConstant: 160),
        
        
        imageSettingBaby.topAnchor.constraint(equalTo: titleSettingLabel.bottomAnchor, constant: 20),
        imageSettingBaby.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        imageSettingBaby.heightAnchor.constraint(equalToConstant: 110),
        imageSettingBaby.widthAnchor.constraint(equalToConstant: 110),
        
        titleBabyLabel.topAnchor.constraint(equalTo: imageSettingBaby.bottomAnchor, constant: 20),
        titleBabyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        titleBabyLabel.heightAnchor.constraint(equalToConstant: 20),
        titleBabyLabel.widthAnchor.constraint(equalToConstant: 60),
        
        cinemaSettingLabel.topAnchor.constraint(equalTo: titleBabyLabel.bottomAnchor, constant: 60),
        cinemaSettingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        cinemaSettingLabel.heightAnchor.constraint(equalToConstant: 10),
        cinemaSettingLabel.widthAnchor.constraint(equalToConstant: 180),
        
        ageSettingLabel.topAnchor.constraint(equalTo: cinemaSettingLabel.bottomAnchor, constant: 10),
        ageSettingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        ageSettingLabel.heightAnchor.constraint(equalToConstant: 20),
        ageSettingLabel.widthAnchor.constraint(equalToConstant: 160),
        
        
        readyButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 340),
        readyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        readyButton.heightAnchor.constraint(equalToConstant: 30),
        readyButton.widthAnchor.constraint(equalToConstant: 110),
        
        cancellationButton.topAnchor.constraint(equalTo: ageSettingLabel.bottomAnchor, constant: 60),
        cancellationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        cancellationButton.heightAnchor.constraint(equalToConstant: 50),
        cancellationButton.widthAnchor.constraint(equalToConstant: 380),
        
        banButton.topAnchor.constraint(equalTo: cancellationButton.bottomAnchor, constant: 20),
        banButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        banButton.heightAnchor.constraint(equalToConstant: 50),
        banButton.widthAnchor.constraint(equalToConstant: 380),
        
        ])
    }
        }
