////
////  ProfileUIView.swift
////  KinopoiskCloneAPI
////
////  Created by Николай Гринько on 14.10.2023.
////
//
//import Foundation
//import UIKit
//
//
//class ProfileUIView: UIView {
//    
//    
//    
//    let containerNameView: UIView = {
//        let container = UIView()
//        container.frame = CGRect(x: 0, y: 0, width: 395, height: 320)
//        container.backgroundColor = .tertiarySystemBackground
//        container.layer.cornerRadius = 20
//        return container
//    }()
//    
//    private let myImageAvat: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(systemName: "person")
//        imageView.contentMode = .center
//        imageView.frame = CGRect(x: 145, y: 30, width: 80, height: 80)
//        imageView.layer.cornerRadius = 40
//        imageView.layer.masksToBounds = true
//        let borderColor = UIColor(red: 230/255, green: 135/255, blue: 100/255, alpha: 1)
//        imageView.layer.borderColor = borderColor.cgColor
//        imageView.layer.borderWidth = 5
//        return imageView
//    }()
//    
//    private let nameAvatarLabel: UILabel = {
//        let nameAvatar = UILabel()
//        nameAvatar.text = "Гринько Николай"
//        nameAvatar.frame = CGRect(x: 110, y: 120, width: 180, height: 20)
//        nameAvatar.font = .boldSystemFont(ofSize: 18)
//        nameAvatar.textColor = .white
//        return nameAvatar
//    }()
//    
//    private let nameUrlAvatarLabel: UILabel = {
//        let nameAvatar = UILabel()
//        nameAvatar.text = "grinkonikolka@yandex.ru"
//        nameAvatar.frame = CGRect(x: 110, y: 140, width: 180, height: 20)
//        nameAvatar.font = .boldSystemFont(ofSize: 12)
//        nameAvatar.textColor = .lightGray
//        return nameAvatar
//    }()
//    
//    private let babyButton: UIButton = {
//        var configuration = UIButton.Configuration.filled()
//        configuration.image = UIImage(named: "baby")
//        // между контентом
//        configuration.imagePadding = 10
//        
//        configuration.imagePlacement = .leading
//        configuration.titleAlignment = .trailing
//        configuration.baseBackgroundColor = .tertiarySystemBackground
//        configuration.attributedTitle = AttributedString("Дети  12+", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(white: 230/120, alpha: 1)]))
//        configuration.buttonSize = .large
//        configuration.contentInsets = .init(top: 5, leading: 10, bottom: 5, trailing: 105)
//        configuration.cornerStyle = .large
//        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { action in
//          //debugPrint("Tapped One Button!")
//        }))
//        button.frame = CGRect(x: 10, y: 200, width: 220, height: 50)
//        return button
//    }()
//    
//    
//    private lazy var oneButton: UIButton = {
//        var configuration = UIButton.Configuration.filled()
//        configuration.imagePadding = 10
//        configuration.imagePlacement = .leading
//        configuration.titleAlignment = .trailing
//        configuration.baseBackgroundColor = .systemGray4
//        configuration.attributedTitle = AttributedString("Запретить", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(white: 230/120, alpha: 1)]))
//        configuration.buttonSize = .medium
//        configuration.contentInsets = .init(top: 5, leading: 10, bottom: 5, trailing: 10)
//        configuration.cornerStyle = .capsule
//        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { action in
//            //debugPrint("Tapped One Button!")
//        }))
//        button.frame = CGRect(x: 250, y: 200, width: 120, height: 35)
//        return button
//    }()
//
//    
//    private let settingButton: UIButton = {
//        var configuration = UIButton.Configuration.filled()
//        configuration.image = UIImage(named: "setting")
//        // между контентом
//        configuration.imagePadding = 10
//        configuration.imagePlacement = .leading
//        configuration.titleAlignment = .leading
//        configuration.baseBackgroundColor = .tertiarySystemBackground
//        configuration.attributedTitle = AttributedString("Редактировать", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(white: 230/120, alpha: 1)]))
//        configuration.buttonSize = .large
//        configuration.contentInsets = .init(top: 5, leading: -5, bottom: 5, trailing: 55)
//        configuration.cornerStyle = .large
//        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { action in
//          //debugPrint("Tapped One Button!")
//        }))
//        button.frame = CGRect(x: 10, y: 250, width: 250, height: 60)
//        return button
//    }()
//    
//    private let namePlusLabel: UILabel = {
//        let nameAvatar = UILabel()
//        nameAvatar.text = "Вы в Плюсе"
//        nameAvatar.frame = CGRect(x: 15, y: 360, width: 180, height: 20)
//        nameAvatar.font = .boldSystemFont(ofSize: 25)
//        nameAvatar.textColor = .white
//        return nameAvatar
//    }()
//    
//    let containerYouPlus: UIView = {
//        let container = UIView()
//        container.frame = CGRect(x: 15, y: 400, width: 350, height: 120)
//        container.backgroundColor = .tertiarySystemBackground
//        container.layer.cornerRadius = 20
//        return container
//    }()
//    
//    private lazy var youPlusButton: UIButton = {
//        var configuration = UIButton.Configuration.filled()
//        configuration.image = UIImage(systemName: "chevron.right")
//        // между контентом
//        configuration.imagePadding = 5
//        configuration.imagePlacement = .trailing
//        configuration.titleAlignment = .leading
//        configuration.baseBackgroundColor = .tertiarySystemBackground
//        configuration.attributedTitle = AttributedString("Управлять", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(white: 230/120, alpha: 1)]))
//        configuration.buttonSize = .medium
//        configuration.contentInsets = .init(top: 80, leading: 15, bottom: 5, trailing: 230)
//        configuration.cornerStyle = .medium
//        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { action in
//          debugPrint("Tapped One Button!")
//        }))
//        button.frame = CGRect(x: 15, y: 400, width: 350, height: 120)
//        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
//        return button
//    }()
//    
//    @objc private func tapButton() {
//        print("Запретить")
//    }
//    
//    private let plusAktiveLabel: UILabel = {
//        let nameAvatar = UILabel()
//        nameAvatar.text = "Плюс активен"
//        nameAvatar.frame = CGRect(x: 15, y: 10, width: 140, height: 20)
//        nameAvatar.font = .boldSystemFont(ofSize: 20)
//        nameAvatar.textColor = .white
//        return nameAvatar
//    }()
//    
//    private let plusDeyliButton: UIButton = {
//        var configuration = UIButton.Configuration.filled()
//        configuration.image = UIImage(systemName: "chevron.right")
//        // между контентом
//        configuration.imagePadding = 5
//        configuration.imagePlacement = .trailing
//        configuration.titleAlignment = .leading
//        configuration.baseBackgroundColor = .tertiarySystemBackground
//        configuration.attributedTitle = AttributedString("Вас ждут подарки", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(white: 230/120, alpha: 1)]))
//        configuration.buttonSize = .medium
//        configuration.contentInsets = .init(top: 80, leading: 15, bottom: 5, trailing: 165)
//        configuration.cornerStyle = .medium
//        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { action in
//          //debugPrint("Tapped One Button!")
//        }))
//        button.frame = CGRect(x: 15, y: 530, width: 350, height: 120)
//        return button
//    }()
//    
//    private let plusDailyLabel: UILabel = {
//        let nameAvatar = UILabel()
//        nameAvatar.text = "Плюс Дейли"
//        nameAvatar.frame = CGRect(x: 15, y: 10, width: 120, height: 20)
//        nameAvatar.font = .boldSystemFont(ofSize: 20)
//        nameAvatar.textColor = .white
//        return nameAvatar
//    }()
//    
//    private let imageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "present")
//        imageView.frame = CGRect(x: 240, y: 10, width: 100, height: 110)
//        return imageView
//    }()
//    
//    private let toInviteFriendButton: UIButton = {
//        var configuration = UIButton.Configuration.filled()
//        configuration.image = UIImage(systemName: "chevron.right")
//        // между контентом
//        configuration.imagePadding = 5
//        configuration.imagePlacement = .trailing
//        configuration.titleAlignment = .leading
//        configuration.baseBackgroundColor = .tertiarySystemBackground
//        configuration.attributedTitle = AttributedString("Пригласить друга", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(white: 230/120, alpha: 1)]))
//        configuration.buttonSize = .medium
//        configuration.contentInsets = .init(top: 80, leading: 15, bottom: 5, trailing: 165)
//        configuration.cornerStyle = .medium
//        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { action in
//          //debugPrint("Tapped One Button!")
//        }))
//        button.frame = CGRect(x: 15, y: 660, width: 350, height: 120)
//        return button
//    }()
//    
//    private let getPointsLabel: UILabel = {
//        let nameAvatar = UILabel()
//        nameAvatar.text = "Получить 300 баллов"
//        nameAvatar.frame = CGRect(x: 15, y: 10, width: 190, height: 20)
//        nameAvatar.font = .boldSystemFont(ofSize: 18)
//        nameAvatar.textColor = .white
//        return nameAvatar
//    }()
//    
//    private let imageViewPoints: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "points")
//        imageView.frame = CGRect(x: 250, y: 20, width: 90, height: 80)
//        return imageView
//    }()
//    
//    private let nterPromotionalCodeButton: UIButton = {
//        var configuration = UIButton.Configuration.filled()
//        configuration.image = UIImage(systemName: "giftcard.fill")
//        // между контентом
//        configuration.imagePadding = 20
//        configuration.imagePlacement = .leading
//        configuration.titleAlignment = .trailing
//        configuration.baseBackgroundColor = .tertiarySystemBackground
//        configuration.attributedTitle = AttributedString("Ввести промокод", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(white: 230/120, alpha: 1)]))
//        configuration.buttonSize = .large
//        configuration.contentInsets = .init(top: 10, leading: 0, bottom: 10, trailing: 140)
//        configuration.cornerStyle = .large
//        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { action in
//          //debugPrint("Tapped One Button!")
//        }))
//        button.frame = CGRect(x: 15, y: 800, width: 350, height: 70)
//        return button
//    }()
//    
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        addSubview(containerNameView)
//        containerNameView.addSubview(myImageAvat)
//        containerNameView.addSubview(nameAvatarLabel)
//        containerNameView.addSubview(nameUrlAvatarLabel)
//        containerNameView.addSubview(oneButton)
//        containerNameView.addSubview(settingButton)
//        containerNameView.addSubview(babyButton)
//        addSubview(namePlusLabel)
//        addSubview(youPlusButton)
//        youPlusButton.addSubview(plusAktiveLabel)
//        addSubview(plusDeyliButton)
//        plusDeyliButton.addSubview(plusDailyLabel)
//        plusDeyliButton.addSubview(imageView)
//        addSubview(toInviteFriendButton)
//        toInviteFriendButton.addSubview(getPointsLabel)
//        toInviteFriendButton.addSubview(imageViewPoints)
//        addSubview(nterPromotionalCodeButton)
//        
//        backgroundColor = .systemBackground
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//}
//
//
//
//    
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
////    var gradientLayer: CAGradientLayer! {
////        didSet {
////            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
////            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
////            let startColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).cgColor
////            let endColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1).cgColor
////            gradientLayer.colors = [startColor, endColor]
////            //   gradientLayer.locations = [0, 0.2, 1]
////        }
////    }
