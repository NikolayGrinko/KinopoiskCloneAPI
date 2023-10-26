//
//  AboutTheApplicationVC.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 16.10.2023.
//

import UIKit



struct Section12 {
    let options12: [SettingOptionsType12]
}

enum SettingOptionsType12 {
    case staticCell12(model: SettingOptions12)
}

struct SettingOptions12 {
    let title12: String
    let handler12: (() -> Void)
}


class AboutTheApplicationVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var models = [Section12]()
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(AboutSettingProfileTableView.self, forCellReuseIdentifier: AboutSettingProfileTableView.identifier)
        return table
    }()
    
    let contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .black
        return contentView
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "aboutLogo")
        imageView.frame = CGRect(x: 45, y: 60, width: 300, height: 60)
        imageView.backgroundColor = .systemBackground
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Версия 7.21.0, сборка 51688"
        label.frame = CGRect(x: 100, y: 115, width: 220, height: 10)
        label.font = .boldSystemFont(ofSize: 13)
        label.textColor = .systemGray2
        return label
    }()
    
    
    let labelBottom: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = " 'Кинопоиск' может содержать информацию, не предназначенную для несовершеннолетних. Проект компании Яндекс."
        label.frame = CGRect(x: 15, y: 600, width: 330, height: 60)
        label.font = .boldSystemFont(ofSize: 13)
        label.textAlignment = .center
        label.textColor = .systemGray2
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 850)
        contentView.frame = scrollView.bounds
        view.addSubview(scrollView)
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "О приложении"
        scrollView.addSubview(imageView)
        scrollView.addSubview(label)
        scrollView.addSubview(labelBottom)
     
        configureProf()
        configureProfTwo()
        scrollView.addSubview(tableView)
        tableView.frame = CGRect(x: 15, y: 200, width: 350, height: 400)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureProf() {

        models.append(Section12(options12: [
            .staticCell12(model: SettingOptions12(title12: "Лицензионное соглашение") {
                print("Лицензионное соглашение")
                let licenzeVC = LicenzeAboutVC()
                licenzeVC.title = "Настройки Профиля"
                licenzeVC.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(licenzeVC, animated: true)
            }),
            .staticCell12(model: SettingOptions12(title12: "Правила рекомендаций") {
                print("Правила рекомендаций")
                let chatVC = ReccomendeAboutVC()
                chatVC.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(chatVC, animated: true)
            }),
            .staticCell12(model: SettingOptions12(title12: "Условия просмотра") {
                print("Условия просмотра")
                let aboutVC = ViewingConditionsAboutVC()
                aboutVC.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(aboutVC, animated: true)
                
            }),
            .staticCell12(model: SettingOptions12(title12: "Политика конфеденциальности") {
                print("Политика конфеденциальности")
                let aboutVC = PoliticConfidentialAboutVC()
                aboutVC.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(aboutVC, animated: true)
                
            }),

        ]))
    }
    
    private func configureProfTwo() {
        
        models.append(Section12(options12: [
            .staticCell12(model: SettingOptions12(title12: "Справка") {
                print("Справка")
                let settingVC = ReferenceAboutVC()
                settingVC.title = "Настройки Профиля"
                settingVC.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(settingVC, animated: true)
            }),
            .staticCell12(model: SettingOptions12(title12: "Оценить приложение") {
                print("Оценить приложение")
                let chatVC = LikeApplicationAboutVC()
                chatVC.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(chatVC, animated: true)
            }),
            .staticCell12(model: SettingOptions12(title12: "Рекомендовать Кинопоиск друзьям") {
                print("Рекомендовать Кинопоиск друзьям")
                let items:[Any] = [URL(string: "www.kinopoisk.ru")!, UIImage(named: "kinopoisk")!]
                let avc = UIActivityViewController(activityItems: items, applicationActivities: nil)
                //MARK: запрещает совершать действия, которые указал
                avc.excludedActivityTypes = [.airDrop, .copyToPasteboard, .print]
                self.present(avc, animated: true, completion: nil)
            }),
        ]))
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options12.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options12[indexPath.row]
        
        switch model.self {
        case .staticCell12(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AboutSettingProfileTableView.identifier, for: indexPath
            ) as? AboutSettingProfileTableView else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options12[indexPath.row]
        switch type.self {
        case .staticCell12(let model):
            model.handler12()

        }
    }
}
