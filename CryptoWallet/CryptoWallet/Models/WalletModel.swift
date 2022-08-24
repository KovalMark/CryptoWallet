//
//  WalletModel.swift
//  CryptoWallet
//
//  Created by Марк Коваль on 21/08/2022.
//

import UIKit

struct Response: Codable {
    let status: Status
    let data: DataWallet
}

struct Status: Codable {
    let elapsed: Int?
    let timestamp: String?
}

struct DataWallet: Codable {
    let id: String?
    let symbol: String?
    let name: String?
    let marketData: MarketData
    
    enum CodingKeys: String, CodingKey {
        case id
        case symbol
        case name
        case marketData = "market_data"
    }
}

struct MarketData: Codable {
    let priceUsd: Double?
    let priceBtc: Double?
    let changeUsdLastHour: Double?
    let changeBtcLastHour: Double?
    
    enum CodingKeys: String, CodingKey {
        case priceUsd = "price_usd"
        case priceBtc = "price_btc"
        case changeUsdLastHour = "percent_change_usd_last_1_hour"
        case changeBtcLastHour = "percent_change_btc_last_1_hour"
    }
}
