//
//  CityModel.swift
//  CryptoWallet
//
//  Created by Марк Коваль on 24/07/2022.
//

import UIKit

struct City {
    let capital: String
    let country: String
    var title: String {
        "\(capital) - \(country)"
    }
}

extension City {
    static func getCityList() -> [City] {
        [
            City(capital: "Вена", country: "Австрия"),
            City(capital: "Беларусь", country: "Минск"),
            City(capital: "Буркина Фасо", country: "Уагадугу"),
            City(capital: "Венесуэла", country: "Каракас"),
            City(capital: "Греция", country: "Афины"),
            City(capital: "Ирак", country: "Багдад"),
            City(capital: "Италия", country: "Рим"),
            City(capital: "Китай", country: "Пекин"),
            City(capital: "Ливан", country: "Бейрут"),
            City(capital: "Люксембург", country: "Люксембург")
        ]
    }
}
