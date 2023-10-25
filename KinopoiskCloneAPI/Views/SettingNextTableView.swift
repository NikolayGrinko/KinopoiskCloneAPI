//
//  SettingNextTableView.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 23.10.2023.
//

import UIKit

class SettingNextTableView: UITableViewCell {
    
    static let identifier = "SettingNextTableView"
    
     let button: UIButton = {
         let button = UIButton()
         button.layer.cornerRadius = 30
     return button
     }()
     
     private let label: UILabel = {
         let label = UILabel()
         label.font = .boldSystemFont(ofSize: 18)
         label.textColor = .white
         label.numberOfLines = 1
         return label
     }()
    
    
    private let labelBottom: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .systemGray2
        label.numberOfLines = 1
        return label
    }()
    
     
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         contentView.addSubview(button)
         button.addSubview(label)
         button.addSubview(labelBottom)
       
         
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
             y: 10,
             width: 150 ,
             height: 20)
         
         labelBottom.frame = CGRect(
            x: 10,
            y: 40,
            width: 250,
            height: 20)
     }

     
      func configure(with model: NextSettingOptions) {
         label.text = model.titleSetting
          labelBottom.text = model.titleBottom

     }
     
 }

