//
//  BanTapSettingProfile.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 25.10.2023.
//

import UIKit
// xmark.circle


class BanTapSettingProfile: UIViewController {
    
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "baby1")
        imageView.layer.masksToBounds = true
        return imageView
    }()

    private var babyLabel: UILabel = {
        let label = UILabel()
        label.text = "Дети"
        //label.isHidden = true
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    private var videoСlipLabel: UILabel = {
        let label = UILabel()
        let lb = "  "
        label.text = "Выберите ролик: \(lb)  \(lb)  \(lb) \(lb) он мягко обьяснит, что смотреть больше нельзя"
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 27, weight: .bold)
        return label
    }()
    
    private var explainLabel1: UILabel = {
        let label = UILabel()
        label.text = "Ребенок увидит ролик, когда досмотрит фильм или мультик или попытается начать новый"
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .regular)
        //label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let cancellationButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        // между контентом
        configuration.imagePadding = 10
        configuration.titleAlignment = .center
        configuration.baseBackgroundColor = UIColor(red: 217/230, green: 215/230, blue: 212/230, alpha: 1)
        configuration.attributedTitle = AttributedString("Отмена", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(ciColor: .black)]))
        configuration.buttonSize = .large
        configuration.contentInsets = .init(top: 5, leading: 10, bottom: 5, trailing: 10)
        configuration.cornerStyle = .capsule
        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { action in
          //debugPrint("Tapped One Button!")
        }))
        return button
    }()
    
    
    private let readyButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.titleAlignment = .center
        configuration.baseBackgroundColor = .orange
        configuration.attributedTitle = AttributedString("Готово", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(white: 230/120, alpha: 1)]))
        configuration.buttonSize = .large
        configuration.contentInsets = .init(top: 5, leading: 10, bottom: 5, trailing: 10)
        configuration.cornerStyle = .capsule
        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { action in
          //debugPrint("Tapped One Button!")
        }))
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(closeButton)
        view.addSubview(logoImageView)
        view.addSubview(babyLabel)
        view.addSubview(videoСlipLabel)
        view.addSubview(explainLabel1)
        view.addSubview(cancellationButton)
        view.addSubview(readyButton)
        
        navigationItem.title = "Запретить"
        view.backgroundColor = .white
        constraints()
    }
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = .black
        
        button.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        return button
    }()
    
    @objc func dismissAlert() {
        self.dismiss(animated: false)
        self.removeFromParent()
    }
    
    private func constraints() {
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        babyLabel.translatesAutoresizingMaskIntoConstraints = false
        videoСlipLabel.translatesAutoresizingMaskIntoConstraints = false
        explainLabel1.translatesAutoresizingMaskIntoConstraints = false
        cancellationButton.translatesAutoresizingMaskIntoConstraints = false
        readyButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 50),
            closeButton.widthAnchor.constraint(equalToConstant: 50),
            
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            logoImageView.heightAnchor.constraint(equalToConstant: 50),
            logoImageView.widthAnchor.constraint(equalToConstant: 50),
            
            babyLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 95),
            babyLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 20),
            babyLabel.heightAnchor.constraint(equalToConstant: 20),
            babyLabel.widthAnchor.constraint(equalToConstant: 50),
        
            
            videoСlipLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            videoСlipLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            videoСlipLabel.heightAnchor.constraint(equalToConstant: 100),
            videoСlipLabel.widthAnchor.constraint(equalToConstant: 330),
            
            explainLabel1.topAnchor.constraint(equalTo: videoСlipLabel.bottomAnchor, constant: 20),
            explainLabel1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            explainLabel1.heightAnchor.constraint(equalToConstant: 40),
            explainLabel1.widthAnchor.constraint(equalToConstant: 380),
            
            
            cancellationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            cancellationButton.bottomAnchor.constraint(equalTo: readyButton.topAnchor, constant: -20),
            cancellationButton.heightAnchor.constraint(equalToConstant: 50),
            cancellationButton.widthAnchor.constraint(equalToConstant: 360),
            
           
            readyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            readyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            readyButton.heightAnchor.constraint(equalToConstant: 50),
            readyButton.widthAnchor.constraint(equalToConstant: 360),
        ])
    }
    
}
