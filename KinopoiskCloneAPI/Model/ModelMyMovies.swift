//
//  ModelDataMoya.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 09.11.2023.
//

import Foundation


struct ModelMyMovies {
    
    static let shared = ModelMyMovies()
    
    // То что положится в коллекцию и 1 секцию
    private let sales2: ListSection2 = {
        .sales2([.init(title: "Вампипы средней полосы", image: "Вампиры"),
                .init(title: "Беспринципные", image: "Беспринципные"),
                .init(title: "Жизнь по вызову", image: "Жизнь"),
                .init(title: "Криминальное чтиво", image: "Чтиво"),
                .init(title: "Интерстеллар", image: "Интерстеллар"),
                .init(title: "Шрек", image: "Шрек"),
                .init(title: "Король Лев", image: "Лев"),])
    }()
    // То что положится в коллекцию и 2 секцию
    private let category2: ListSection2 = {
        .category2([.init(title: "Загружайте фильмы и сериалы, чтобы смотреть их без интернета", image: "загрузка")])
    }()
    
    // То что положится в коллекцию и 3 секцию
    private let example2: ListSection2 = {
        .example2([.init(title: "Оценки и просмотры", image: "звезда"),
                  .init(title: "Любимые фильмы", image: "сердце"),
                  .init(title: "Рекомендуемые фильмы", image: "лайк"),
                  .init(title: "Примечания", image: "папка"),
                  .init(title: "Персоны", image: "персона")])
    }()

    
    // Массив секций
    var pageData: [ListSection2] {
        [sales2, category2, example2]
    }
}



struct ListItem2 {
    let title: String
    let image: String
}


enum ListSection2 {
    case sales2([ListItem2])
    case category2([ListItem2])
    case example2([ListItem2])
    
    var items: [ListItem2] {
        // пробегаюсь по кейсам
        switch self {
        case .sales2(let items),
                .category2(let items),
                .example2(let items):
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
        case .sales2(_):
            return "Буду смотреть"
        case .category2(_):
            return "Загрузки"
        case .example2(_):
            return "Папки"
        }
    }
    
}

