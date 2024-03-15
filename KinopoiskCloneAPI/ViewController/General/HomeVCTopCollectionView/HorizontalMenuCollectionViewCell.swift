//
//  HorizontalMenuCollectionViewCell.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 15.11.2023.
//

import Foundation
import UIKit

// Реализация цвета, размера и т.д. ячеек сверху главного экрана
class HorizontalMenuCollectionViewCell: UICollectionViewCell {
    
    // Label cells
    let nameCategoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = UIFont(name: "Times New Roman", size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // изменение цвета ячейки и цвета текста
    override var isSelected: Bool {
        didSet {
            backgroundColor = self.isSelected ? .systemBackground : .systemBackground
            nameCategoryLabel.textColor = self.isSelected ? .white : .systemGray2
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
        backgroundColor = .systemBackground
       // layer.cornerRadius = 10
        addSubview(nameCategoryLabel)
    }
    
    
    private func setConstraints() {
     
        NSLayoutConstraint.activate([
        
            nameCategoryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameCategoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        
        ])
        
    }
}

