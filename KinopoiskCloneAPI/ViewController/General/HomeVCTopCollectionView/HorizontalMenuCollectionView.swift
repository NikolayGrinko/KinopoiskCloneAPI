//
//  HorizontalMenuCollectionView.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 15.11.2023.
//

import Foundation
import UIKit

protocol ISelectCollectionViewItemProtocol: AnyObject {
    func selectItem(index: IndexPath)
}

class HorizontalMenuCollectionView: UICollectionView {
    
    private let categoryLayaut = UICollectionViewFlowLayout()
    
    private let nameCategoryArray = ["Like", "And", "Subscribe", "cmb + B, cmd + R", "Dont lovw", "Channel", "Color Cell and", "CollectionViewLayout"]
    
    weak var cellDelegate: ISelectCollectionViewItemProtocol?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: categoryLayaut)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        categoryLayaut.minimumLineSpacing = 5
        categoryLayaut.scrollDirection = .horizontal
        // оттяжка
        bounces = false
        // отключил индикатор
        showsHorizontalScrollIndicator = false
        
        
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
        
        delegate = self
        dataSource = self
        
        register(HorizontalMenuCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
       
        // при загрузке первая ячейка выделена
        selectItem(at: [0, 0], animated: true, scrollPosition: [])
    }
}
// MARK: UICollectionViewDataSource
extension HorizontalMenuCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameCategoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? HorizontalMenuCollectionViewCell else {
            return UICollectionViewCell() }
        cell.nameCategoryLabel.text = nameCategoryArray[indexPath.item]
        return cell
        
    }
}

// MARK: UICollectionViewDelegate
extension HorizontalMenuCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // при нажатии на ячейку, она двигается в центр экрана
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        cellDelegate?.selectItem(index: indexPath)
        
    }
}

// MARK: UICollectionViewDelegateFlowLayout - size cells
extension HorizontalMenuCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let categoryFont = UIFont(name: "Arial Bold", size: 18)
        let categoryAttributes = [NSAttributedString.Key.font: categoryFont as Any]
        let categoryWidth = nameCategoryArray[indexPath.item].size(withAttributes: categoryAttributes).width + 20
        
        return CGSize(width: categoryWidth, height: collectionView.frame.height)
    }
}
