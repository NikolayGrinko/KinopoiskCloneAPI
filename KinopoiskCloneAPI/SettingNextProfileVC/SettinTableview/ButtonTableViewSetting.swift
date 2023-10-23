//
//  ButtonTableViewSetting.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 23.10.2023.
//


import UIKit


class ButtonTableViewSetting: UITableViewCell {
    
    static let identifier = "ButtonTableViewSetting"
    
    
    private var stackOneButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        // configuration.image = UIImage(systemName: "arrow.forward.circle.fill")
        // между контентом
        configuration.titlePadding = 10
        //configuration.imagePlacement = .bottom
        configuration.titleAlignment = .leading
        configuration.baseBackgroundColor = .systemGroupedBackground
        configuration.attributedTitle = AttributedString("Системная", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(white: 230/120, alpha: 1)]))
        configuration.buttonSize = .medium
        configuration.attributedSubtitle = AttributedString("Такая же, как на устройстве", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(cgColor: .init(gray: 230/220, alpha: 0.5))]))
        configuration.buttonSize = .large
        configuration.contentInsets = .init(top: 20, leading: 5, bottom: 10, trailing: 40)
        configuration.cornerStyle = .dynamic
        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { action in
        }))
        // светлая - sun.max , месяц - moon.fill
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var stackTwoButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
         configuration.image = UIImage(systemName: "moon.fill")
        // между контентом
        configuration.imagePadding = 30
        configuration.imagePlacement = .top
        configuration.titleAlignment = .automatic
        configuration.baseBackgroundColor = .systemGray5
//        configuration.attributedTitle = AttributedString("Системная", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(white: 230/120, alpha: 1)]))
//        configuration.buttonSize = .large
        configuration.attributedSubtitle = AttributedString("Темная", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(cgColor: .init(gray: 230/220, alpha: 0.5))]))
        configuration.buttonSize = .small
        configuration.contentInsets = .init(top: 20, leading: 10, bottom: 10, trailing: 10)
        configuration.cornerStyle = .dynamic
        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { action in
        }))
        // светлая - sun.max , месяц - moon.fill
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var stackThreeButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
         configuration.image = UIImage(systemName: "sun.max")
        // между контентом
        configuration.imagePadding = 30
        configuration.imagePlacement = .top
        configuration.titleAlignment = .automatic
        configuration.baseBackgroundColor = .systemGray5
//        configuration.attributedTitle = AttributedString("Системная", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(white: 230/120, alpha: 1)]))
//        configuration.buttonSize = .large
        configuration.attributedSubtitle = AttributedString("Светлая", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor(cgColor: .init(gray: 230/220, alpha: 0.5))]))
        configuration.buttonSize = .small
        configuration.contentInsets = .init(top: 20, leading: 10, bottom: 10, trailing: 10)
        configuration.cornerStyle = .dynamic
        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { action in
        }))
        // светлая - sun.max , месяц - moon.fill
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
  
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .secondarySystemGroupedBackground
        contentView.clipsToBounds = true
        setupGradientLayer()
        //setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
   
    }
    
    func configure(with model: SettingButton) {
        stackOneButton = model.button1
        stackTwoButton = model.button2
        stackThreeButton = model.button3
        
   }
    
    fileprivate func  setupGradientLayer() {

        
        contentView.addSubview(stackOneButton)
        contentView.addSubview(stackTwoButton)
        contentView.addSubview(stackThreeButton)
        
        stackOneButton.translatesAutoresizingMaskIntoConstraints = false
        stackTwoButton.translatesAutoresizingMaskIntoConstraints = false
        stackThreeButton.translatesAutoresizingMaskIntoConstraints = false
        
        stackOneButton.backgroundColor = .secondarySystemGroupedBackground
        stackTwoButton.backgroundColor = .systemGray6
        stackThreeButton.backgroundColor = .systemGray6
        
        NSLayoutConstraint.activate([
            
            contentView.topAnchor.constraint(equalTo: stackOneButton.topAnchor, constant: -10),
            contentView.leadingAnchor.constraint(equalTo: stackOneButton.leadingAnchor, constant: -10),
            //contentView.trailingAnchor.constraint(equalTo: stackOneButton.trailingAnchor, constant: +10),
            stackOneButton.trailingAnchor.constraint(equalTo: stackTwoButton.leadingAnchor, constant: -10),
            contentView.bottomAnchor.constraint(equalTo: stackOneButton.bottomAnchor, constant: +10),
            stackOneButton.heightAnchor.constraint(equalToConstant: 110),            stackOneButton.widthAnchor.constraint(equalToConstant: 160),
            
            
            contentView.topAnchor.constraint(equalTo: stackTwoButton.topAnchor, constant: -10),
//            contentView.leadingAnchor.constraint(equalTo: stackOneButton.safeAreaLayoutGuide.leadingAnchor, constant: -10),
            stackTwoButton.trailingAnchor.constraint(equalTo: stackThreeButton.leadingAnchor, constant: -10),
            contentView.bottomAnchor.constraint(equalTo: stackTwoButton.bottomAnchor, constant: +10),
            stackTwoButton.heightAnchor.constraint(equalToConstant: 110),            stackTwoButton.widthAnchor.constraint(equalToConstant: 75),
            
            contentView.topAnchor.constraint(equalTo: stackThreeButton.topAnchor, constant: -10),
            //contentView.leadingAnchor.constraint(equalTo: stackThreeButton.leadingAnchor, constant: -10),
           // contentView.trailingAnchor.constraint(equalTo: stackTwoButton.safeAreaLayoutGuide.trailingAnchor, constant: 10),
            contentView.bottomAnchor.constraint(equalTo: stackThreeButton.bottomAnchor, constant: +10),
            stackThreeButton.heightAnchor.constraint(equalToConstant: 110),            stackThreeButton.widthAnchor.constraint(equalToConstant: 75),
        ])
    }
}

