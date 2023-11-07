//
//  CategoryCollectionViewCell.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 08.11.2023.
//


import Foundation
import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    private let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        //imageView.backgroundColor = .darkGray
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.image = UIImage(named: "categoryBurger")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Категории"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
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
        backgroundColor = .systemBackground
        layer.cornerRadius = 10
        
         addSubview(categoryLabel)
        addSubview(categoryImageView)
    }
    
    func configureCell(CategoryName: String, imageName: String) {
        categoryLabel.text = CategoryName
        categoryImageView.image = UIImage(named: imageName)
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            categoryLabel.heightAnchor.constraint(equalToConstant: 16),
            
            
            categoryImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            categoryImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            categoryImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            categoryImageView.bottomAnchor.constraint(equalTo: categoryLabel.topAnchor, constant: 0),
           
        ])
    }
}


