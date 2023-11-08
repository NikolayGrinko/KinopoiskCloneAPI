//
//  TwoCategoryCollectionViewCell.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 09.11.2023.
//

import Foundation
import UIKit

class TwoCategoryCollectionViewCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .darkGray
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.image = UIImage(named: "categoryBurger")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Категории"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.borderWidth = 2
                layer.borderColor = .init(red: 218/230, green: 28/230, blue: 22/230, alpha: 1)
            } else {
                layer.borderWidth = 0
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 10
        
         addSubview(label)
        addSubview(imageView)
    }
    
    func configureCell(CategoryName: String, imageName: String) {
        label.text = CategoryName
        imageView.image = UIImage(named: imageName)
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 55),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -55),
            label.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -40),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            label.heightAnchor.constraint(equalToConstant: 40),
            //categoryLabel.widthAnchor.constraint(equalToConstant: 200),
            
            
            imageView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: -40),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
            //categoryImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            imageView.heightAnchor.constraint(equalToConstant: 40),
            imageView.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
}


