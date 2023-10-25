//
//  ProfileViewController.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 11.10.2023.
//

import UIKit

struct Section {
    //let title1: String
    let options: [SettingOptionsType]
}

enum SettingOptionsType {
    case staticCell(model: SettingOptions)
   // case switchCell(model: SettingSwitchOptions)
}

struct SettingSwitchOptions {
    //let title: String
    //let titleMinText: String
    let handler: (() -> Void)
    let isOn: Bool
}

struct SettingOptions {
    let title: String
    //let titleTrailing: String
    let handler: (() -> Void)
}


class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingProfileTableViewCell.self, forCellReuseIdentifier: SettingProfileTableViewCell.identifier)
        return table
    }()
    
    
    var models = [Section]()
 
    let contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .black
        return contentView
    }()
    
    
    
    
    let containerNameView: UIView = {
        let container = UIView()
        container.frame = CGRect(x: 0, y: 0, width: 395, height: 320)
        container.backgroundColor = .tertiarySystemBackground
        container.layer.cornerRadius = 20
        return container
    }()
    
    private let myImageAvat: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "user3")
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: 33, y: 32, width: 76, height: 76)
        imageView.layer.cornerRadius = 38
        imageView.layer.masksToBounds = true
        let borderColor = UIColor(red: 23/255, green: 13/255, blue: 10/255, alpha: 1)
        imageView.layer.backgroundColor = borderColor.cgColor
        //imageView.layer.borderWidth = 5
        return imageView
    }()
    
    private let myImageGradient: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "gradient")
        //imageView.contentMode = .center
        imageView.frame = CGRect(x: 120, y: 0, width: 140, height: 140)
        imageView.layer.cornerRadius = 70
        imageView.layer.masksToBounds = true
        //let borderColor = UIColor(red: 230/255, green: 135/255, blue: 100/255, alpha: 1)
        //imageView.layer.borderColor = borderColor.cgColor
        //imageView.layer.borderWidth = 5
        return imageView
    }()
    
    private let nameAvatarLabel: UILabel = {
        let nameAvatar = UILabel()
        nameAvatar.text = "Гринько Николай"
        nameAvatar.frame = CGRect(x: 110, y: 120, width: 180, height: 20)
        nameAvatar.font = .boldSystemFont(ofSize: 18)
        nameAvatar.textColor = .white
        return nameAvatar
    }()
    
    private let nameUrlAvatarLabel: UILabel = {
        let nameAvatar = UILabel()
        nameAvatar.text = "grinkonikolka@yandex.ru"
        nameAvatar.frame = CGRect(x: 110, y: 140, width: 180, height: 20)
        nameAvatar.font = .boldSystemFont(ofSize: 12)
        nameAvatar.textColor = .lightGray
        return nameAvatar
    }()
    
    private let babyButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(named: "baby")
        // между контентом
        configuration.imagePadding = 10
        
        configuration.imagePlacement = .leading
        configuration.titleAlignment = .trailing
        configuration.baseBackgroundColor = .tertiarySystemBackground
        configuration.attributedTitle = AttributedString("Дети  12+", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(white: 230/120, alpha: 1)]))
        configuration.buttonSize = .large
        configuration.contentInsets = .init(top: 5, leading: 10, bottom: 5, trailing: 105)
        configuration.cornerStyle = .large
        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { action in
          //debugPrint("Tapped One Button!")
        }))
        button.frame = CGRect(x: 10, y: 200, width: 220, height: 50)
        return button
    }()
    
    
    private lazy var oneButton: UIButton = {
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
        button.frame = CGRect(x: 250, y: 200, width: 120, height: 35)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()

   
      @objc private func tapButton() {
          print("Запретить")
      }
    
    private let settingButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(named: "setting")
        // между контентом
        configuration.imagePadding = 10
        configuration.imagePlacement = .leading
        configuration.titleAlignment = .leading
        configuration.baseBackgroundColor = .tertiarySystemBackground
        configuration.attributedTitle = AttributedString("Редактировать", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(white: 230/120, alpha: 1)]))
        configuration.buttonSize = .large
        configuration.contentInsets = .init(top: 5, leading: -5, bottom: 5, trailing: 55)
        configuration.cornerStyle = .large
        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { action in
          //debugPrint("Tapped One Button!")
        }))
        button.frame = CGRect(x: 10, y: 250, width: 250, height: 60)
        return button
    }()
    
    private let namePlusLabel: UILabel = {
        let nameAvatar = UILabel()
        nameAvatar.text = "Вы в Плюсе"
        nameAvatar.frame = CGRect(x: 15, y: 360, width: 180, height: 20)
        nameAvatar.font = .boldSystemFont(ofSize: 25)
        nameAvatar.textColor = .white
        return nameAvatar
    }()
    
    
    private lazy var youPlusButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(systemName: "chevron.right")
        // между контентом
        configuration.imagePadding = 5
        configuration.imagePlacement = .trailing
        configuration.titleAlignment = .leading
        configuration.baseBackgroundColor = .tertiarySystemBackground
        configuration.attributedTitle = AttributedString("Управлять", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(white: 230/120, alpha: 1)]))
        configuration.buttonSize = .medium
        configuration.contentInsets = .init(top: 80, leading: 15, bottom: 5, trailing: 230)
        configuration.cornerStyle = .medium
        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { action in
          debugPrint("Tapped One Button!")
        }))
        button.frame = CGRect(x: 15, y: 400, width: 350, height: 120)
        
        return button
    }()
    
    
    private let plusAktiveLabel: UILabel = {
        let nameAvatar = UILabel()
        nameAvatar.text = "Плюс активен"
        nameAvatar.frame = CGRect(x: 15, y: 10, width: 140, height: 20)
        nameAvatar.font = .boldSystemFont(ofSize: 20)
        nameAvatar.textColor = .white
        return nameAvatar
    }()
    
    private let plusDeyliButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(systemName: "chevron.right")
        // между контентом
        configuration.imagePadding = 5
        configuration.imagePlacement = .trailing
        configuration.titleAlignment = .leading
        configuration.baseBackgroundColor = .tertiarySystemBackground
        configuration.attributedTitle = AttributedString("Вас ждут подарки", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(white: 230/120, alpha: 1)]))
        configuration.buttonSize = .medium
        configuration.contentInsets = .init(top: 80, leading: 15, bottom: 5, trailing: 165)
        configuration.cornerStyle = .medium
        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { action in
          //debugPrint("Tapped One Button!")
        }))
        button.frame = CGRect(x: 15, y: 530, width: 350, height: 120)
        return button
    }()
    
    private let plusDailyLabel: UILabel = {
        let nameAvatar = UILabel()
        nameAvatar.text = "Плюс Дейли"
        nameAvatar.frame = CGRect(x: 15, y: 10, width: 120, height: 20)
        nameAvatar.font = .boldSystemFont(ofSize: 20)
        nameAvatar.textColor = .white
        return nameAvatar
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "present")
        imageView.frame = CGRect(x: 240, y: 10, width: 100, height: 110)
        return imageView
    }()
    
    private let toInviteFriendButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(systemName: "chevron.right")
        // между контентом
        configuration.imagePadding = 5
        configuration.imagePlacement = .trailing
        configuration.titleAlignment = .leading
        configuration.baseBackgroundColor = .tertiarySystemBackground
        configuration.attributedTitle = AttributedString("Пригласить друга", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(white: 230/120, alpha: 1)]))
        configuration.buttonSize = .medium
        configuration.contentInsets = .init(top: 80, leading: 15, bottom: 5, trailing: 165)
        configuration.cornerStyle = .medium
        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { action in
          //debugPrint("Tapped One Button!")
        }))
        button.frame = CGRect(x: 15, y: 660, width: 350, height: 120)
        return button
    }()
    
    private let getPointsLabel: UILabel = {
        let nameAvatar = UILabel()
        nameAvatar.text = "Получить 300 баллов"
        nameAvatar.frame = CGRect(x: 15, y: 10, width: 190, height: 20)
        nameAvatar.font = .boldSystemFont(ofSize: 18)
        nameAvatar.textColor = .white
        return nameAvatar
    }()
    
    private let imageViewPoints: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "points")
        imageView.frame = CGRect(x: 250, y: 20, width: 90, height: 80)
        return imageView
    }()
    
    private let enterPromotionalCodeButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(systemName: "giftcard.fill")
        // между контентом
        configuration.imagePadding = 20
        configuration.imagePlacement = .leading
        configuration.titleAlignment = .trailing
        configuration.baseBackgroundColor = .tertiarySystemBackground
        configuration.attributedTitle = AttributedString("Ввести промокод", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(white: 230/120, alpha: 1)]))
        configuration.buttonSize = .large
        configuration.contentInsets = .init(top: 10, leading: 0, bottom: 10, trailing: 140)
        configuration.cornerStyle = .large
        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { action in
          //debugPrint("Tapped One Button!")
        }))
        button.frame = CGRect(x: 15, y: 800, width: 350, height: 70)
        return button
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBackground
        button.setTitle("Выйти из аккаунта", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.frame = CGRect(x: 100, y: 1100, width: 200, height: 40)
        button.addTarget(self, action: #selector(checkTransition), for: .touchUpInside)
        return button
    }()
    
    @objc private func checkTransition() {
        print("Выйти из аккаунта")
        let alert = UIAlertController(title: nil, message: "Вы уверены, что хотите выйти?", preferredStyle: .actionSheet)
        let camBth = UIAlertAction(title: "Выйти", style: .destructive, handler: nil)
       
        
        let cancel = UIAlertAction(title: "Остаться", style: .cancel, handler: nil)
        
        alert.addAction(camBth)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        
        navigationController?.navigationBar.isTranslucent = false
       
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 1250)
        contentView.frame = scrollView.bounds
        view.addSubview(scrollView)
        //scrollView.addSubview(contentView)
        //scrollView.addSubview(profileUIView)
        configureProf()
        scrollView.addSubview(tableView)
        tableView.frame = CGRect(x: 15, y: 900, width: 350, height: 210)
        tableView.delegate = self
        tableView.dataSource = self
        
        scrollView.addSubview(containerNameView)
        //containerNameView.addSubview(myImageAvat)
        containerNameView.addSubview(myImageGradient)
        
        myImageGradient.addSubview(myImageAvat)
        containerNameView.addSubview(nameAvatarLabel)
        containerNameView.addSubview(nameUrlAvatarLabel)
        containerNameView.addSubview(oneButton)
        containerNameView.addSubview(settingButton)
        containerNameView.addSubview(babyButton)
        scrollView.addSubview(namePlusLabel)
        scrollView.addSubview(youPlusButton)
        youPlusButton.addSubview(plusAktiveLabel)
        scrollView.addSubview(plusDeyliButton)
        plusDeyliButton.addSubview(plusDailyLabel)
        plusDeyliButton.addSubview(imageView)
        scrollView.addSubview(toInviteFriendButton)
        toInviteFriendButton.addSubview(getPointsLabel)
        toInviteFriendButton.addSubview(imageViewPoints)
        scrollView.addSubview(enterPromotionalCodeButton)
        
        scrollView.addSubview(cancelButton)
      
    }
    
  
    
    func configureProf() {

        models.append(Section(options: [
            .staticCell(model: SettingOptions(title: "Настройки") {
                print("Tapped Настройки")
                let settingVC = SettingNextProfileVC()
                //settingVC.title = "Настройки Профиля"
                settingVC.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(settingVC, animated: true)
            }),
            .staticCell(model: SettingOptions(title: "Чат с поддержкой") {
                print("Tapped Чат с поддержкой")
                let chatVC = ChatWithSupportVC()
                chatVC.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(chatVC, animated: true)
            }),
            .staticCell(model: SettingOptions(title: "О приложении") {
                let aboutVC = AboutTheApplicationVC()
                aboutVC.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(aboutVC, animated: true)
                print("Tapped О приложении")
            }),

        ]))
    }
 
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingProfileTableViewCell.identifier, for: indexPath
            ) as? SettingProfileTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        switch type.self {
        case .staticCell(let model):
            model.handler()

        }
    }
}



