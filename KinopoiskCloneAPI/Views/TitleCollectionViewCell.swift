//
//  TitleCollectionViewCell.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 09.10.2023.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {
    //let title = UILabel()
    // вью на которую кладешь фото загруженное
    let imageView = UIImageView()
    static let identifier = "TitleCollectionViewCell"
    
   let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
        
        // кладеж имедж вью на вью корневую и задаешь раз меры загруженного контента
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
        
        //contentView.addSubview(title)
//        title.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            title.centerXAnchor.constraint(equalTo: centerXAnchor),
//            title.centerYAnchor.constraint(equalTo: centerYAnchor)
        //])
        backgroundColor = .red
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
}
