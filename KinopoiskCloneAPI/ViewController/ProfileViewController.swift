//
//  ProfileViewController.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 11.10.2023.
//

import UIKit

class ProfileViewController: UIViewController {
 
    let profileUIView = ProfileUIView()
 
    let contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .black
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 1500)
        contentView.frame = scrollView.bounds
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(profileUIView)
     
    }
    
}

