//
//  ProfileUIView.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 14.10.2023.
//

import Foundation
import UIKit



class ProfileUIView: UIView {
    
    let containerView: UIView = {
        let container = UIView()
        container.frame = CGRect(x: 10, y: 0, width: 380, height: 350)
        container.backgroundColor = .tertiarySystemBackground
        container.layer.cornerRadius = 10
        return container
    }()
    
    let containerView2: UIView = {
        let container = UIView()
        container.frame = CGRect(x: 10, y: 390, width: 380, height: 650)
        container.backgroundColor = .tertiarySystemBackground
        container.layer.cornerRadius = 10
        return container
    }()
    
    //    var gradientLayer: CAGradientLayer! {
    //        didSet {
    //            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
    //            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
    //            let startColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).cgColor
    //            let endColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1).cgColor
    //            gradientLayer.colors = [startColor, endColor]
    //            //   gradientLayer.locations = [0, 0.2, 1]
    //        }
    //    }
    
    private let myImageAvat: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        imageView.contentMode = .center
        imageView.frame = CGRect(x: 145, y: 50, width: 80, height: 80)
        imageView.layer.cornerRadius = 40
        imageView.layer.masksToBounds = true
        let borderColor = UIColor(red: 230/255, green: 135/255, blue: 100/255, alpha: 1)
        imageView.layer.borderColor = borderColor.cgColor
        imageView.layer.borderWidth = 5
        return imageView
    }()
    
    private let nameAvatarLabel: UILabel = {
        let nameAvatar = UILabel()
        nameAvatar.text = "Гринько Николай"
        nameAvatar.frame = CGRect(x: 110, y: 140, width: 180, height: 20)
        nameAvatar.font = .boldSystemFont(ofSize: 18)
        nameAvatar.textColor = .white
        return nameAvatar
    }()
    
    private let nameUrlAvatarLabel: UILabel = {
        let nameAvatar = UILabel()
        nameAvatar.text = "grinkonikolka@yandex.ru"
        nameAvatar.frame = CGRect(x: 110, y: 160, width: 180, height: 20)
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
        return imageView
    }()
    
    private let nameBabyLabel: UILabel = {
        let nameAvatar = UILabel()
        nameAvatar.text = "Дети"
        nameAvatar.frame = CGRect(x: 80, y: 220, width: 50, height: 20)
        nameAvatar.font = .boldSystemFont(ofSize: 18)
        nameAvatar.textColor = .white
        return nameAvatar
    }()
    
    private let nameAgeLabel: UILabel = {
        let nameAvatar = UILabel()
        nameAvatar.text = "12+"
        nameAvatar.frame = CGRect(x: 80, y: 240, width: 50, height: 20)
        nameAvatar.font = .boldSystemFont(ofSize: 14)
        nameAvatar.textColor = .systemGray
        return nameAvatar
    }()
    
    private let oneButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.imagePadding = 10
        configuration.imagePlacement = .leading
        configuration.titleAlignment = .trailing
        configuration.baseBackgroundColor = .systemGray4
        configuration.attributedTitle = AttributedString("Запретить", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(white: 230/120, alpha: 1)]))
        configuration.buttonSize = .medium
        configuration.contentInsets = .init(top: 5, leading: 10, bottom: 5, trailing: 10)
        configuration.cornerStyle = .capsule
        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { action in
            //debugPrint("Tapped One Button!")
        }))
        button.frame = CGRect(x: 250, y: 220, width: 120, height: 35)
        return button
    }()
    
    private let imageSettingAvatar: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "setting")
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 10, y: 270, width: 60, height: 60)
        imageView.layer.cornerRadius = 30
        let borderColor = UIColor(red: 2/255, green: 2/255, blue: 2/255, alpha: 1)
        imageView.layer.borderColor = borderColor.cgColor
        imageView.layer.borderWidth = 0
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var settingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Редактировать", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.frame = CGRect(x: 65, y: 270, width: 150, height: 60)
        return button
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(containerView)
        containerView.addSubview(myImageAvat)
        containerView.addSubview(nameAvatarLabel)
        containerView.addSubview(nameUrlAvatarLabel)
        containerView.addSubview(imageBabyAvatar)
        containerView.addSubview(nameBabyLabel)
        containerView.addSubview(nameAgeLabel)
        containerView.addSubview(oneButton)
        containerView.addSubview(imageSettingAvatar)
        containerView.addSubview(settingButton)
        addSubview(containerView2)
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



    

