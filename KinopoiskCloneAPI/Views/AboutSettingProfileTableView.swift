//
//  AboutSettingProfileTableView.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 24.10.2023.
//

import UIKit

class AboutSettingProfileTableView: UITableViewCell {
    

static let identifier = "SettingableViewCell"

 let button: UIButton = {
     let button = UIButton()
     //button.layer.cornerRadius = 40
 return button
 }()
 
 private let label: UILabel = {
     let label = UILabel()
     label.font = .boldSystemFont(ofSize: 15)
     label.numberOfLines = 1
     return label
 }()
 
 override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
     super.init(style: style, reuseIdentifier: reuseIdentifier)
     contentView.addSubview(button)
     //contentView.layer.cornerRadius = 30
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
         width: 280 ,
         height: 50)
 }

 
  func configure(with model: SettingOptions12) {
     label.text = model.title12

 }
 
}


