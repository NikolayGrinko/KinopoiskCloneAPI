//
//  GalleryCollectionViewCell.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 25.10.2023.
//

import UIKit

struct ModelBaby {
    var mainImage: UIImage
    var babyTextLabel: String
//    var smallDescription: String
//    var cost: Int
    
    static func finishWatching() -> [ModelBaby] {
        let firstItem = ModelBaby(mainImage: UIImage(named: "smeh1")!,
                               babyTextLabel: "На сегодня хватит")
        let secondItem = ModelBaby(mainImage: UIImage(named: "smeh2")!,
                                    babyTextLabel: "Кино кончилось")
        let thirdItem = ModelBaby(mainImage: UIImage(named: "smeh3")!,
                                   babyTextLabel: "Феноменально!")
        
        return [firstItem, secondItem, thirdItem]
    }
}

struct Constants {
    static let leftDistanceToView: CGFloat = 10
    static let rightDistanceToView: CGFloat = 10
    static let galleryMinimumLineSpacing: CGFloat = 10
    static let galleryItemWidth = (UIScreen.main.bounds.width - Constants.leftDistanceToView - Constants.rightDistanceToView - (Constants.galleryMinimumLineSpacing / 2)) / 2
}


class GalleryCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "GalleryCollectionViewCell"
    
    let mainImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = #colorLiteral(red: 0.007841579616, green: 0.007844132371, blue: 0.007841020823, alpha: 1)
        return label
    }()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(mainImageView)
        addSubview(nameLabel)
        
        backgroundColor = .white
        constraints()
        
    }
    
    private func constraints() {
        
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            mainImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2),
            
            // nameLabel constraints
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 12),
            
        ])
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5
        self.layer.shadowRadius = 9
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 5, height: 8)
        
        self.clipsToBounds = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
