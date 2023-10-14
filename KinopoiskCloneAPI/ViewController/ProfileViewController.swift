//
//  ProfileViewController.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 11.10.2023.
//

import UIKit

class ProfileViewController: UIViewController {
 
    let profileUIView = ProfileUIView()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 1500)
        
        view.addSubview(scrollView)
        scrollView.addSubview(profileUIView)
     
    }
    
}

