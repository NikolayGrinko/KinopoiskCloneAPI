//
//  NextSettingTapTableview.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 23.10.2023.
//

import UIKit
// MARK: НЕ РЕАЛИЗОВНО ПОКА ЧТО
struct SettingSection {
    //let title1: String
    let optionsSetting: [SettingOptionsSetting]
}

enum SettingOptionsSetting {
    case staticCell(model: NextSettingOptions)
   
}

struct NextSettingOptions {
    let titleSetting: String
    let titleBottom: String
    //let titleTrailing: String
    let handler: (() -> Void)
}

class NextSettingTapTableview: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingNextTableView.self, forCellReuseIdentifier: SettingNextTableView.identifier)
        return table
    }()
    
    
    var models = [SettingSection]()
    
    let contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .black
        return contentView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Качество видео"
        
        contentView.frame = tableView.bounds
        contentView.addSubview(tableView)
        tableView.frame = CGRect(x: 15, y: 90, width: 350, height: 200)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureProf() {
        
        models.append(SettingSection(optionsSetting: [
            .staticCell(model: NextSettingOptions(titleSetting: "Максимальное", titleBottom: "Лучшее качество, занимает много места") {
                print("Максимальное")
                
            }),
            .staticCell(model: NextSettingOptions(titleSetting: "Оптимальное", titleBottom: "Хорошее качество, не занимает много места") {
                print("Оптимальное")
            }),
            .staticCell(model: NextSettingOptions(titleSetting: "Минимальное", titleBottom: "Плохое качество, почти не занимает места") {
                print("Минимальное")
            }),
            
        ]))
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].optionsSetting.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].optionsSetting[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingNextTableView.identifier, for: indexPath
            ) as? SettingNextTableView else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
            
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].optionsSetting[indexPath.row]
        switch type.self {
        case .staticCell(let model):
            model.handler()
            
        }
    }
}
