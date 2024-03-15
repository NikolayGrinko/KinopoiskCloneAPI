//
//  ModelDataSearch.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 08.11.2023.
//

import Foundation



struct ModelDataSearch {
    
    static let shared = ModelDataSearch()
    
    // То что положится в коллекцию и 1 секцию
    private let sales: ListSection = {
        .sales([.init(title: "Популярные фильмы", image: "01"),
                .init(title: "Популярные сериалы", image: "02"),
                .init(title: "Ближайшие премьеры", image: "03"),
                .init(title: "100 Великих сериала", image: "04"),
                .init(title: "Лучшие фильмы по версии Sight & Sound", image: "05"),
                .init(title: "Лучшие фильмы по версии BBC", image: "06"),
                .init(title: "Лучшие фильмы по версии BBC", image: "07"),])
    }()
    // То что положится в коллекцию и 2 секцию
    private let category: ListSection = {
        .category([.init(title: "Фильмы", image: "01"),
                   .init(title: "Кинотеатр", image: "02"),
                   .init(title: "Жанры", image: "03"),
                   .init(title: "Страны", image: "04"),
                   .init(title: "Годы", image: "05"),
                   .init(title: "Критика", image: "06"),
                   .init(title: "Сериалы", image: "07"),
                   .init(title: "Сборы", image: "01"),
                   .init(title: "Премии", image: "02")])
    }()
    
    // То что положится в коллекцию и 3 секцию
    private let example: ListSection = {
        .example([.init(title: "Tomn Hardi", image: "15"),
                  .init(title: "Tom Kruz", image: "16"),
                  .init(title: "Gvinet Loy", image: "17"),
                  .init(title: "Liza Liza", image: "18"),
                  .init(title: "Lola React", image: "19"),
                  .init(title: "Milla Yovov", image: "20"),
                  .init(title: "Silen Diaz", image: "21")
        ])
    }()

    
    // Массив секций
    var pageData: [ListSection] {
        [sales, category, example]
    }
}



struct ListItem {
    let title: String
    let image: String
}




enum ListSection {
    case sales([ListItem])
    case category([ListItem])
    case example([ListItem])
    
    var items: [ListItem] {
        // пробегаюсь по кейсам
        switch self {
        case .sales(let items),
                .category(let items),
                .example(let items):
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
        case .sales(_):
            return "Советуем посмотреть"
        case .category(_):
            return "Категории"
        case .example(_):
            return "Популярные персоны"
        }
    }
    
}
