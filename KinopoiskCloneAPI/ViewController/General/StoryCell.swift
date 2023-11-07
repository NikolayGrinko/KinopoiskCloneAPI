//
//  StoryCell.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 31.10.2023.
//

import UIKit

struct ModelBabyNew {
    var babyTextLabel2: String

    
    static func finishWatching2() -> [ModelBabyNew] {
        let firstItem = ModelBabyNew(babyTextLabel2: "Мое кино")
        let secondItem = ModelBabyNew(babyTextLabel2: "Спорт")
        let thirdItem = ModelBabyNew(babyTextLabel2: "Каналы")
        let fourthItem = ModelBabyNew(babyTextLabel2: "Загрузить")
        let fifthItem = ModelBabyNew(babyTextLabel2: "Подписки")
        
        return [firstItem, secondItem, thirdItem, fourthItem, fifthItem]
    }
}


final class StoryCell: UICollectionViewCell {
    
   static let identifier = "storyCell"
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    private lazy var containerView: UIView = {
       
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //addSubview(nameLabel)
        self.setupSelf()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.width
        self.containerView.layer.cornerRadius = 0
    }
    
//    func setup() {
//        self.layer.borderColor = UIColor.red.cgColor
//        self.layer.borderWidth = 2.0
//        
//    }
    
    
    private func setupSelf() {
        self.backgroundColor = .systemBackground
        
        self.addSubview(self.containerView)
        containerView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
        
            self.containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: -4),
            self.containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            self.containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            self.containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            
        
            self.nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: -4),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            self.nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            
        ])
    }
}

