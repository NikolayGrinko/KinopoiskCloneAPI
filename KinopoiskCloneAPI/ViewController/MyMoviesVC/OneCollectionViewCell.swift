//
//  OneCollectionViewCell.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 09.11.2023.
//


import Foundation
import UIKit

class OneCollectionViewCell : UICollectionViewCell {
   
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = " "
        label.textAlignment = .left
        label.clipsToBounds = true
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupview()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func  setupview() {
        backgroundColor = .systemBackground
        addSubview(imageView)
        addSubview(label)
    }
    
    func configureCell(CategoryName: String, imageName: String) {
        imageView.image = UIImage(named: imageName)
        label.text = CategoryName
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -10),
            
            
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            label.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

