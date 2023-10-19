//
//  ChatWithSupportVC.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 16.10.2023.
//

import UIKit


class ChatWithSupportVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Чат с поддержкой"
    }
    
}
