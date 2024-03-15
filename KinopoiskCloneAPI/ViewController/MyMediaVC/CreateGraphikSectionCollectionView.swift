//
//  CreateGraphikSectionCollectionView.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 10.11.2023.
//

import Foundation
import UIKit

class CreateGraphikSectionCollectionView : UICollectionViewCell {
   
    private let saleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let categoryLabel2: UILabel = {
        let label = UILabel()
        label.text = " "
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
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
        addSubview(saleImageView)
        addSubview(categoryLabel2)
    }
    
    func configureCell(CategoryName: String, imageName: String) {
        saleImageView.image = UIImage(named: imageName)
        categoryLabel2.text = CategoryName
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            saleImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            saleImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            saleImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            saleImageView.bottomAnchor.constraint(equalTo: categoryLabel2.topAnchor, constant: 0),
            
            
            categoryLabel2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            categoryLabel2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),
            categoryLabel2.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            categoryLabel2.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
