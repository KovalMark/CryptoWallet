//
//  WalletService.swift
//  CryptoWallet
//
//  Created by Марк Коваль on 21/08/2022.
//

import UIKit

enum ServiceConstant {
    static let host = "data.messari.io"
    enum Path: String, CaseIterable {
        case btc = "/api/v1/assets/btc/metrics"
        case eth = "/api/v1/assets/eth/metrics"
        case tron = "/api/v1/assets/tron/metrics"
        case polkadot = "/api/v1/assets/polkadot/metrics"
        case dogecoin = "/api/v1/assets/dogecoin/metrics"
        case tether = "/api/v1/assets/tether/metrics"
        case stellar = "/api/v1/assets/stellar/metrics"
        case cardano = "/api/v1/assets/cardano/metrics"
        case xrp = "/api/v1/assets/xrp/metrics"
        case eos = "/api/v1/assets/eos/metrics"
    }
}

final class WalletService {
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        return session
    }()
    
    func addCoin(_ paths: ServiceConstant.Path) async -> DataWallet? {
        
        let url = configureUrl(paths)
        
        do {
            let (data, _) = try await session.data(from: url)
            let decoder = JSONDecoder()
            let result = try decoder.decode(Response.self, from: data)
            return result.data
        } catch {
            print(error)
            return nil
        }
    }
}

// MARK: - Private
private extension WalletService {
    
    func configureUrl(_ path: ServiceConstant.Path) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = ServiceConstant.host
        components.path = path.rawValue
        guard let url = components.url else { return URL(fileURLWithPath: "") }
        return url
    }
}
