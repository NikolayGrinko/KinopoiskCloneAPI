//
//  ModelDataMedia.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 10.11.2023.
//

import Foundation


struct ModelDataMedia {
    
    static let shared = ModelDataMedia()
    
    // То что положится в коллекцию и 1 секцию
    private let saless: ListSections = {
        .saless([.init(title: "Вызов", image: "вызов"),
                .init(title: "Быть", image: "быть"),
                .init(title: "Гипнотик", image: "гипнотик"),
                .init(title: "ФорсажХ", image: "форсажХ"),
                .init(title: "Разбой", image: "разбой"),
                .init(title: "Мег2", image: "мег2"),
                .init(title: "Оппенгеймер", image: "оппенгеймер"),])
    }()
    // То что положится в коллекцию и 2 секцию
    private let categorya: ListSections = {
        .categorya([.init(title: "Кинотеатры", image: "cinema"),
                   .init(title: "Центр досуга", image: "досуг"),
                   .init(title: "Prada 3D", image: "prada"),
                   .init(title: "Синема Де Люкс", image: "люкс"),
                   .init(title: "Лаб DUX", image: "лаб")])
    }()
    
    // То что положится в коллекцию и 3 секцию
    private let examples: ListSections = {
        .example([.init(title: "В кино с 20 декабря 2023г", image: "wonka")])
    }()

    // То что положится в коллекцию и 4 секцию
    private let graphik: ListSections = {
        .graphic([.init(title: "Инвазион", image: "инвазион"),
                .init(title: "Крид", image: "крид"),
                .init(title: "Лютер", image: "лютер"),
                .init(title: "Ковенант", image: "ковенант"),
                .init(title: "Шафер", image: "шафер")])
    }()
    
    // То что положится в коллекцию и 5 секцию
    private let trailer: ListSections = {
        .trailer([.init(title: "Переводчик 2021", image: "переводчик"),
                .init(title: "Форсаж 2022", image: "форсаж"),
                .init(title: "Мстители 2023", image: "мстители"),
                .init(title: "Перевозчик 2020", image: "перевозчик"),
                .init(title: "Молнии 2023", image: "молнии")])
    }()
    // Массив секций
    var pageData: [ListSections] {
        [saless, categorya, examples, graphik, trailer]
    }
}



struct ListItems {
    let title: String
    let image: String
}




enum ListSections {
    case saless([ListItems])
    case categorya([ListItems])
    case example([ListItems])
    case graphic([ListItems])
    case trailer([ListItems])
    
    var items: [ListItems] {
        // пробегаюсь по кейсам
        switch self {
        case .saless(let items),
                .categorya(let items),
                .example(let items),
                .graphic(let items),
                .trailer(let items):
            return items
        }
    }
    // количество секций в ListSection
    var count: Int {
        items.count
    }
    // Название секций
    var title: String {
        switch self {
        case .saless(_):
            return "Сегодня в кино"
        case .categorya(_):
            return "Досуг"
        case .example(_):
            return "Реклама"
        case .graphic(_):
            return "График премьер"
        case.trailer(_):
            return "Новые трейлеры"
        }
    }
    
}
