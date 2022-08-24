//
//  WalletService.swift
//  CryptoWallet
//
//  Created by Марк Коваль on 21/08/2022.
//

import UIKit

final class WalletService {
    
    func addCoin(completion: @escaping (Result<DataWallet, Error>) -> Void) {
        
        guard
            let urlBtc = URL(string: "https://data.messari.io/api/v1/assets/btc/metrics"),
            let urlEth = URL(string: "https://data.messari.io/api/v1/assets/eth/metrics"),
            let urlTron = URL(string: "https://data.messari.io/api/v1/assets/tron/metrics"),
            let urlPolkadot = URL(string: "https://data.messari.io/api/v1/assets/polkadot/metrics"),
            let urlDogecoin = URL(string: "https://data.messari.io/api/v1/assets/dogecoin/metrics"),
            let urlTether = URL(string: "https://data.messari.io/api/v1/assets/tether/metrics"),
            let urlStellar = URL(string: "https://data.messari.io/api/v1/assets/stellar/metrics"),
            let urlCardano = URL(string: "https://data.messari.io/api/v1/assets/cardano/metrics"),
            let urlXrp = URL(string: "https://data.messari.io/api/v1/assets/xrp/metrics"),
            let urlEos = URL(string: "https://data.messari.io/api/v1/assets/eos/metrics")
        else { return }
        
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
        
        let taskTron =  URLSession.shared.dataTask(with: urlTron) { data, _, error in
            
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
        taskTron.resume()
        
        let taskPolkadot =  URLSession.shared.dataTask(with: urlPolkadot) { data, _, error in
            
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
        taskPolkadot.resume()
        
        let taskDogecoin =  URLSession.shared.dataTask(with: urlDogecoin) { data, _, error in
            
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
        taskDogecoin.resume()
        
        let taskTether =  URLSession.shared.dataTask(with: urlTether) { data, _, error in
            
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
        taskTether.resume()
        
        let taskStellar =  URLSession.shared.dataTask(with: urlStellar) { data, _, error in
            
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
        taskStellar.resume()
        
        let taskCardano =  URLSession.shared.dataTask(with: urlCardano) { data, _, error in
            
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
        taskCardano.resume()
        
        let taskXrp =  URLSession.shared.dataTask(with: urlXrp) { data, _, error in
            
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
        taskXrp.resume()
        
        let taskEos =  URLSession.shared.dataTask(with: urlEos) { data, _, error in
            
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
        taskEos.resume()
    }
}
