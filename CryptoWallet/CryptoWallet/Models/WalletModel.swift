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
    let market_data: MarketData
}

struct MarketData: Codable {
    let price_usd: Double?
    let price_btc: Double?
    let percent_change_usd_last_1_hour: Double?
    let percent_change_btc_last_1_hour: Double?
}
