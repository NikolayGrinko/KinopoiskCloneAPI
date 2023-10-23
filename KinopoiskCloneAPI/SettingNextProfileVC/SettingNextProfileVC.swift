//
//  SettingNextProfileVC.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 16.10.2023.
//

import UIKit


struct SectionNew {
    let titleOne: String
    let options2: [SettingOptionsNew]
}

enum SettingOptionsNew {
    case staticButton(model: SettingButton)
    case staticCell(model: SettingOptionsNext)
    case switchCell(model: SettingSwitchOptionsNext)
}

struct SettingButton {
    let button1: UIButton
    let button2: UIButton
    let button3: UIButton
    let handler: (() -> Void)
}

struct SettingSwitchOptionsNext {
    let title: String
    let titleMinText: String
    let handler: (() -> Void)
    let isOn: Bool
}

struct SettingOptionsNext {
    let title2: String
    let titleTrailingSetting: String
    let handler: (() -> Void)
}

class SettingNextProfileVC: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    var button = UIButton()
    var models = [SectionNew]()
    
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        table.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        table.register(ButtonTableViewSetting.self, forCellReuseIdentifier: ButtonTableViewSetting.identifier)
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let scrollView = UIScrollView(frame: view.bounds)
//        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 2000)
//        view.addSubview(scrollView)
//        scrollView.addSubview(tableView)
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.isTranslucent = false
     
        navigationItem.title = "Загрузки"
        
        configureSetting()
        //title = "Загрузки"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        
        
        
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }
    func configureSetting() {
        
        models.append(SectionNew(titleOne: "Загрузки", options2: [
            .switchCell(model: SettingSwitchOptionsNext(title: "Загружать только по WI-Fi", titleMinText: "", handler: {
            }, isOn: true)),
               
    
                .staticCell(model: SettingOptionsNext(title2: "Качество видео", titleTrailingSetting: "Оптимальное") {
                print("Tapped first cell")
            }),
           
                .switchCell(model: SettingSwitchOptionsNext(title: "Не блокировать экран", titleMinText: "Во время загрузки экран не будет блокироваться, чтобы скачивание не прервалось", handler: {
                //Во время загрузки экран не будет блокироваться, чтобы скачивание не прервалось
            }, isOn: true)),
        ]))
        
        models.append(SectionNew(titleOne: "Устройства", options2: [
            .staticCell(model: SettingOptionsNext(title2: "Мои устройства", titleTrailingSetting: "") {
            }),
        ]))
        
        models.append(SectionNew(titleOne: "Просмотр", options2: [
            .staticCell(model: SettingOptionsNext(title2: "Язык аудиодорожки", titleTrailingSetting: "Русский") {
            }),
            .switchCell(model: SettingSwitchOptionsNext(title: "Автопропуск титров", titleMinText: "Включим следующую серию через 5 секунд, не дожидаясь оканчания титров", handler: {
                // Включим следующую серию через 5 секунд, не дожидаясь оканчания титров
            }, isOn: true)),
        ]))
        
        models.append(SectionNew(titleOne: "Подписка", options2: [
            .staticCell(model: SettingOptionsNext(title2: "Восстановление подписки", titleTrailingSetting: "") {
            }),
        ]))
        
        models.append(SectionNew(titleOne: "Тема оформления", options2: [
            .staticButton(model: SettingButton(button1: button, button2: button, button3: button) {
            }),
           
        ]))
        
        models.append(SectionNew(titleOne: "Иконка приложения", options2: [
            .switchCell(model: SettingSwitchOptionsNext(title: "Альтернативная иконка", titleMinText: "", handler: {
            }, isOn: true)),
        ]))
        
        models.append(SectionNew(titleOne: "Местоположение", options2: [
            .switchCell(model: SettingSwitchOptionsNext(title: "Определять автоматически", titleMinText: "", handler: {
            }, isOn: true)),
            .staticCell(model: SettingOptionsNext(title2: "Рязань", titleTrailingSetting: "") {
            }),
        ]))
        
        models.append(SectionNew(titleOne: "Прочее", options2: [
            .switchCell(model: SettingSwitchOptionsNext(title: "Вибрация", titleMinText: "Тактильные сигналы при управлении", handler: {
                // Тактильные сигналы при управлении
            }, isOn: true)),
            .switchCell(model: SettingSwitchOptionsNext(title: "Реклама в приложении", titleMinText: "", handler: {
                // Тактильные сигналы при управлении
            }, isOn: true)),
        ]))
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.titleOne
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options2.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = models[indexPath.section].options2[indexPath.row]
        
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath
            ) as? SettingTableViewCell else {
                return UITableViewCell()
            }
            cell.configureMod(with: model)
            return cell
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier, for: indexPath
            ) as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        case .staticButton(model: let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewSetting.identifier, for: indexPath) as? ButtonTableViewSetting else {
                return UITableViewCell()
        }
            cell.configure(with: model)
            return cell
        
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
      
    }
    
}




