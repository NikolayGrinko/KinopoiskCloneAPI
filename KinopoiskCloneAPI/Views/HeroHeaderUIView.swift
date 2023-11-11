//
//  HeroHeaderUIView.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 09.10.2023.
//

import UIKit

class HeroHeaderUIView: UIView {
    
    
    private let oneButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(systemName: "play.fill")
        // между контентом
        configuration.imagePadding = 10
        configuration.imagePlacement = .leading
        configuration.titleAlignment = .trailing
        configuration.baseBackgroundColor = .orange
        configuration.attributedTitle = AttributedString("Смотреть", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(white: 230/120, alpha: 1)]))
        configuration.buttonSize = .large
        configuration.contentInsets = .init(top: 5, leading: 10, bottom: 5, trailing: 10)
        configuration.cornerStyle = .capsule
        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { action in
            //debugPrint("Tapped One Button!")
        }))
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private let twoButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(systemName: "bookmark")
        // между контентом
        configuration.imagePadding = 10
        configuration.imagePlacement = .leading
        //configuration.titleAlignment = .trailing
        configuration.baseBackgroundColor = .blue
        //configuration.attributedTitle = AttributedString("Смотреть", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(white: 230/120, alpha: 1)]))
        configuration.buttonSize = .large
        configuration.contentInsets = .init(top: 5, leading: 10, bottom: 5, trailing: 10)
        configuration.cornerStyle = .capsule
        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { action in
            //debugPrint("Tapped One Button!")
        }))
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let threeButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(systemName: "minus.circle")
        // между контентом
        configuration.imagePadding = 10
        configuration.imagePlacement = .leading
        //configuration.titleAlignment = .trailing
        configuration.baseBackgroundColor = .red
        //configuration.attributedTitle = AttributedString("Смотреть", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(white: 230/120, alpha: 1)]))
        configuration.buttonSize = .large
        configuration.contentInsets = .init(top: 5, leading: 10, bottom: 5, trailing: 10)
        configuration.cornerStyle = .capsule
        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { action in
            //debugPrint("Tapped One Button!")
        }))
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "heroImage")
        return imageView
    }()
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            //MARK: сменить black and systemBackground
            UIColor.black.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(twoButton)
        addSubview(threeButton)
        addSubview(oneButton)
        applyConstraints()
    }
    
    private func  applyConstraints() {
        
        
        
        let oneButtonConstraints = [
            
            oneButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            oneButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            oneButton.widthAnchor.constraint(equalToConstant: 150),
            oneButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        let twoButtonConstraints = [
            
            twoButton.leadingAnchor.constraint(equalTo: oneButton.trailingAnchor, constant: 20),
            twoButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            twoButton.widthAnchor.constraint(equalToConstant: 50),
            twoButton.heightAnchor.constraint(equalToConstant: 50)
            
        ]
        
        let threeButtonConstraints = [
            
            threeButton.leadingAnchor.constraint(equalTo: twoButton.trailingAnchor, constant: 20),
            threeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            threeButton.widthAnchor.constraint(equalToConstant: 50),
            threeButton.heightAnchor.constraint(equalToConstant: 50)
            
        ]
        
        NSLayoutConstraint.activate(oneButtonConstraints)
        NSLayoutConstraint.activate(twoButtonConstraints)
        NSLayoutConstraint.activate(threeButtonConstraints)
        
    }
    
    public func configure(with model: TitleViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {
            return
        }
        
        heroImageView.sd_setImage(with: url, completed: nil)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

