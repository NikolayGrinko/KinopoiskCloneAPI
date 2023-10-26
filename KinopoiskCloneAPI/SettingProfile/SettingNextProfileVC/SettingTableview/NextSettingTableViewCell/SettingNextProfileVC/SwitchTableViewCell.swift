//
//  SwitchTableViewCell.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 19.10.2023.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
    
    static let identifier = "SwitchTableViewCell"
    
    private let label1: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    private let labelMinText: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.textColor = .systemGray
        return label
    }()
    
    private let mySwitch: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.onTintColor = .systemBlue
        return mySwitch
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.clipsToBounds = true
        // > - accessoryType = .disclosureIndicator
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        contentView.addSubview(label1)
        contentView.addSubview(labelMinText)
        contentView.addSubview(mySwitch)
        
        contentView.backgroundColor = .secondarySystemGroupedBackground
        
        label1.translatesAutoresizingMaskIntoConstraints = false
        labelMinText.translatesAutoresizingMaskIntoConstraints = false
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        
        labelMinText.backgroundColor = .secondarySystemGroupedBackground
        label1.backgroundColor = .secondarySystemGroupedBackground
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: label1.topAnchor, constant: -15),
            contentView.leadingAnchor.constraint(equalTo: label1.leadingAnchor, constant: -10),
            contentView.trailingAnchor.constraint(equalTo: label1.leadingAnchor, constant: -10),
            label1.heightAnchor.constraint(equalToConstant: 20),
            label1.widthAnchor.constraint(equalToConstant: 240),
            
            
            contentView.bottomAnchor.constraint(equalTo: labelMinText.bottomAnchor, constant: +15),
            contentView.leadingAnchor.constraint(equalTo: labelMinText.leadingAnchor, constant: -10),
            contentView.trailingAnchor.constraint(equalTo: labelMinText.leadingAnchor, constant: -10),
            labelMinText.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: +5),
            
            labelMinText.widthAnchor.constraint(equalToConstant: 240),
            
            contentView.centerYAnchor.constraint(equalTo: mySwitch.centerYAnchor, constant: 10),
            contentView.trailingAnchor.constraint(equalTo: mySwitch.trailingAnchor, constant: 40),
            mySwitch.widthAnchor.constraint(equalToConstant: 25),
            mySwitch.heightAnchor.constraint(equalToConstant: 15),
            
            
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        labelMinText.text = nil
        label1.text = nil
        mySwitch.isOn = false
    }
    
    func configure(with model: SettingSwitchOptionsNext) {
        label1.text = model.title
        labelMinText.text = model.titleMinText
        mySwitch.isOn = model.isOn
    }
    

}
 

