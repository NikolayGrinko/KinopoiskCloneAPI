//
//  ExclusiveCollectionViewCell.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 10.11.2023.
//

import Foundation
import UIKit

class ExclusiveCollectionViewCell: UICollectionViewCell {
    
    private let burgerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "burger1")  // name
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Категории"
        label.textAlignment = .center
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
        //layer.cornerRadius = 10
        
        addSubview(burgerImageView)
        //addSubview(backgroundTitleView)
        addSubview(nameLabel)

    }
    
//    func configureCell(imageName: String) {
//        burgerImageView.image = UIImage(named: imageName)
//    }
    
    func configureCell(CategoryName: String, imageName: String) {
        nameLabel.text = CategoryName
        burgerImageView.image = UIImage(named: imageName)
    }
        
    func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            burgerImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            burgerImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            burgerImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            burgerImageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -10),
            
            
            
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            nameLabel.heightAnchor.constraint(equalToConstant: 16),

        ])
    }
}
