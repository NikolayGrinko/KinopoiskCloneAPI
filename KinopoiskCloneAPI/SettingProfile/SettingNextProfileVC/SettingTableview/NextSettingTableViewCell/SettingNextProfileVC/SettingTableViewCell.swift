//
//  SettingTableViewCell.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 19.10.2023.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

   static let identifier = "SettingableViewCell"
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        
        label.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer.init(target: self,action:#selector(actionTappedLabel))
       
        tapGesture.numberOfTapsRequired = 1
        label.addGestureRecognizer(tapGesture)
        
        return label
    }()
    
    @objc func actionTappedLabel() {
            print("tapped label--> №1")
       
        
        
        }
    
    private lazy var labelTrailing: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        label.textColor = .systemGray
        
        // MARK: add Tap and LABEL
        label.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer.init(target: self,action:#selector(actionTapped))
       
        tapGesture.numberOfTapsRequired = 1
        label.addGestureRecognizer(tapGesture)
        return label
    }()
    

    @objc func actionTapped() {
            print("tapped LABEL")
        
        }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        contentView.addSubview(label)
        contentView.addSubview(labelTrailing)
        
        contentView.backgroundColor = .secondarySystemGroupedBackground
        
        label.translatesAutoresizingMaskIntoConstraints = false
        labelTrailing.translatesAutoresizingMaskIntoConstraints = false
        
        labelTrailing.backgroundColor = .secondarySystemGroupedBackground
        label.backgroundColor = .secondarySystemGroupedBackground
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: label.topAnchor, constant: -25),
            contentView.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: +25),
            contentView.leadingAnchor.constraint(equalTo: label.leadingAnchor, constant: -10),
            contentView.trailingAnchor.constraint(equalTo: labelTrailing.trailingAnchor, constant: 5),
            label.heightAnchor.constraint(equalToConstant: 20),
            
            
            
            contentView.topAnchor.constraint(equalTo: labelTrailing.topAnchor, constant: -25),
            contentView.bottomAnchor.constraint(equalTo: labelTrailing.bottomAnchor, constant: +25),
            contentView.leadingAnchor.constraint(equalTo: label.leadingAnchor, constant: -10),
            contentView.trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: -10),
            label.heightAnchor.constraint(equalToConstant: 20)
            
        ])
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
        labelTrailing.text = nil
      
    }
    
     func configureMod(with model: SettingOptionsNext) {
        label.text = model.title2
         labelTrailing.text = model.titleTrailingSetting
    }
    
}
