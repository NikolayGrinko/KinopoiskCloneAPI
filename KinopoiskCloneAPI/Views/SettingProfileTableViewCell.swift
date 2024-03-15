//
//  SettingProfileTableViewCell.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 15.10.2023.
//

import Foundation
import UIKit

class SettingProfileTableViewCell: UITableViewCell {
    
    static let identifier = "SettingableViewCell"
    
     let button: UIButton = {
         let button = UIButton()
         button.layer.cornerRadius = 30
     return button
     }()
     
     private let label: UILabel = {
         let label = UILabel()
         label.numberOfLines = 1
         return label
     }()
     
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         contentView.addSubview(button)
         button.addSubview(label)
       
         
         contentView.clipsToBounds = true
         accessoryType = .disclosureIndicator
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     override func layoutSubviews() {
         super.layoutSubviews()

         
         label.frame = CGRect(
             x: 10 ,
             y: 0,
             width: 150 ,
             height: 40)
     }

     
      func configure(with model: SettingOptions) {
         label.text = model.title

     }
     
 }

