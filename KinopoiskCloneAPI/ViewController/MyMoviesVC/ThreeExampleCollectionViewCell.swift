//
//  ThreeExampleCollectionViewCell.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 09.11.2023.
//

import Foundation
import UIKit

class ThreeExampleCollectionViewCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "burger1")  // name
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Категории"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func  setupView() {
        clipsToBounds = true
        backgroundColor = .secondarySystemBackground
        //layer.cornerRadius = 10
        
        addSubview(imageView)
        //addSubview(backgroundTitleView)
        addSubview(nameLabel)

    }
    
//    func configureCell(imageName: String) {
//        burgerImageView.image = UIImage(named: imageName)
//    }
    
    func configureCell(CategoryName: String, imageName: String) {
        nameLabel.text = CategoryName
        imageView.image = UIImage(named: imageName)
    }
        
    func setConstraints() {
        
        NSLayoutConstraint.activate([
        
//            burgerImageView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
//            burgerImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
//            burgerImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -30),
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 80),
            
            
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
