//
//  HorizontalMenuCollectionViewCell.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 15.11.2023.
//

import Foundation
import UIKit


class HorizontalMenuCollectionViewCell: UICollectionViewCell {
    
    let nameCategoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "Arial Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // изменение цвета ячейки и цвета текста
    override var isSelected: Bool {
        didSet {
            backgroundColor = self.isSelected ? .red : .systemGray4
            nameCategoryLabel.textColor = self.isSelected ? .black : .white
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .systemGray4
        layer.cornerRadius = 10
        addSubview(nameCategoryLabel)
    }
    
    
    private func setConstraints() {
     
        NSLayoutConstraint.activate([
        
            nameCategoryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameCategoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        
        ])
        
    }
}

