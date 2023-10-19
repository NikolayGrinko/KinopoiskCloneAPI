//
//  AboutTheApplicationVC.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 16.10.2023.
//

import UIKit

class AboutTheApplicationVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "О приложении"
    }
    
}
