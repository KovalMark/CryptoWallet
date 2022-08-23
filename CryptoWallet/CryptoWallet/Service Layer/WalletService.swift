//
//  WalletService.swift
//  CryptoWallet
//
//  Created by Марк Коваль on 21/08/2022.
//

import UIKit

final class WalletService {

    func addCoin(completion: @escaping (Result<DataWallet, Error>) -> Void) {
        
        guard let urlBtc = URL(string: "https://data.messari.io/api/v1/assets/btc/metrics") else { return }
        guard let urlEth = URL(string: "https://data.messari.io/api/v1/assets/eth/metrics") else { return }
        
        let taskBtc =  URLSession.shared.dataTask(with: urlBtc) { data, _, error in
            
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(Response.self, from: data)
                    completion(.success(result.data))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        taskBtc.resume()
        
        let taskEth =  URLSession.shared.dataTask(with: urlEth) { data, _, error in
            
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(Response.self, from: data)
                    completion(.success(result.data))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        taskEth.resume()
    }
}

//guard let urlBtc = URL(string: "https://data.messari.io/api/v1/assets/btc/metrics") else { return }
//guard let urlEth = URL(string: "https://data.messari.io/api/v1/assets/eth/metrics") else { return }
//guard let urlTron = URL(string: "https://data.messari.io/api/v1/assets/tron/metrics") else { return }
//guard let urlPolkadot = URL(string: "https://data.messari.io/api/v1/assets/polkadot/metrics") else { return }
//guard let urlDogecoin = URL(string: "https://data.messari.io/api/v1/assets/dogecoin/metrics") else { return }
//guard let urlTether = URL(string: "https://data.messari.io/api/v1/assets/tether/metrics") else { return }
//guard let urlStellar = URL(string: "https://data.messari.io/api/v1/assets/stellar/metrics") else { return }
//guard let urlCardano = URL(string: "https://data.messari.io/api/v1/assets/cardano/metrics") else { return }
//guard let urlXrp = URL(string: "https://data.messari.io/api/v1/assets/xrp/metrics") else { return }
