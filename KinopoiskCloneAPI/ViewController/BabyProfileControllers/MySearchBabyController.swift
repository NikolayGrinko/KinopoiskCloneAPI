//
//  MySettingBabyController.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 27.10.2023.
//

import UIKit

class MySearchBabyController: UIViewController {
    
    private var titles: [Title] = [Title]()
    
    private let searchController: UISearchController = {
        
        let controller = UISearchController(searchResultsController: SearchResultsViewController())
        //MARK: metod ставит цвет текста в строке поиска
        controller.searchBar.searchTextField.attributedPlaceholder =  NSAttributedString.init(string: "Search anything...", attributes: [NSAttributedString.Key.foregroundColor:UIColor.lightGray])
        controller.searchBar.searchBarStyle = .minimal
        
        return controller
    }()
    
    private let mySmehImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "smeh5")
       // imageView.layer.cornerRadius = 50
        //imageView.contentMode = .center
        imageView.frame = CGRect(x: 100, y: 270, width: 220, height: 220)
        imageView.layer.cornerRadius = 70
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let nameAvatarLabel: UILabel = {
        let nameAvatar = UILabel()
        nameAvatar.text = "Ищем в подписке и ваших покупках то, что подходит по возрасту"
        nameAvatar.frame = CGRect(x: 60, y: 500, width: 280, height: 100)
        nameAvatar.numberOfLines = 0
        nameAvatar.textAlignment = .center
        nameAvatar.font = .boldSystemFont(ofSize: 18)
        nameAvatar.textColor = .systemGray
        return nameAvatar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Поиск"
        view.backgroundColor = .white
    
        view.addSubview(mySmehImage)
        view.addSubview(nameAvatarLabel)
        navigationController?.navigationBar.isHidden = false
        
        navigationItem.searchController = searchController
        navigationController?.navigationBar.tintColor = .black
        
      
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}
