//
//  WalletController.swift
//  CryptoWallet
//
//  Created by Марк Коваль on 24/07/2022.
//

import UIKit
import SnapKit

// MARK: WalletController
final class WalletController: UIViewController {
    
    private let walletTable = UITableView()
    private let service = WalletService()
    private var data: [DataWallet] = []
    private let identifier = "walletCell"
    private var pointSorted = 1
    private let queue = DispatchQueue.main
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        configData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    // MARK: setUpView
    private func setUpView() {
        
        // NavigationBar
        createCustomNavigationBar()
        
        // LogOutBarButton
        let logOutButton = createCustomButton(titleName: "LogOut", selector: #selector(logOutButtonTapped))
        navigationItem.leftBarButtonItem = logOutButton
        
        // SortedBarButton
        let sortedButton = createCustomButton(titleName: "Sorted", selector: #selector(sortedButtonTapped))
        navigationItem.rightBarButtonItem = sortedButton
        
        // TableView
        walletTable.backgroundColor = #colorLiteral(red: 0.9381344914, green: 0.9331676364, blue: 0.9246369004, alpha: 1)
        walletTable.separatorColor = #colorLiteral(red: 0.1599435508, green: 0.185090214, blue: 0.167404592, alpha: 1)
        walletTable.delegate = self
        walletTable.dataSource = self
        walletTable.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        view.addSubview(walletTable)
        walletTable.snp.makeConstraints { maker in
            maker.left.top.right.bottom.equalToSuperview().inset(0)
        }
    }
    
    @objc private func logOutButtonTapped() {
        let startController = StartController()
        startController.resetDefaults()
        navigationController?.pushViewController(startController, animated: true)
    }
    
    private func configData() {
        data = []

		Task {
			guard
				let btc = await service.addCoin(.btc),
				let cardano = await service.addCoin(.cardano),
				let dogecoin = await service.addCoin(.dogecoin),
				let eos = await service.addCoin(.eos),
				let eth = await service.addCoin(.eth),
				let polkadot = await service.addCoin(.polkadot),
				let stellar = await service.addCoin(.stellar),
				let tether = await service.addCoin(.tether),
				let tron = await service.addCoin(.tron),
				let xrp = await service.addCoin(.xrp)
			else
			{ return }
			[btc, cardano, dogecoin, eos, eth, polkadot, stellar, tether, tron, xrp].forEach { data.append($0) }
			DispatchQueue.main.async {
				self.walletTable.reloadData()
			}
		}
    }
    
    @objc private func sortedButtonTapped() {
        if pointSorted == 1 {
            data = data.sorted{ $0.marketData.changeUsdLastHour ?? 0 < $1.marketData.changeUsdLastHour ?? 0 }
            pointSorted = pointSorted - 1
        } else {
            data = data.sorted{ $1.marketData.changeUsdLastHour ?? 0 < $0.marketData.changeUsdLastHour ?? 0 }
            pointSorted = pointSorted + 1
        }
        walletTable.reloadData()
    }
    
    func alertVC() {
        let alertVC = UIAlertController(
                    title: "Error",
                    message: "Error connecting to the server",
                    preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertVC.addAction(action)
                self.present(alertVC, animated: true, completion: nil)
    }
}

// MARK: Delegate
extension WalletController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

// MARK: DataSource
extension WalletController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = walletTable.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.backgroundColor = #colorLiteral(red: 0.9381344914, green: 0.9331676364, blue: 0.9246369004, alpha: 1)
        let coin = data[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = coin.symbol
        content.secondaryText = String(coin.marketData.changeUsdLastHour ?? 0.0)
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coin = data[indexPath.row]
        let infoController = InfoController()
        
        queue.async {
            infoController.firstTextLabel.text = coin.name
            infoController.firstNumberLabel.text = coin.symbol
            
            infoController.secondTextLabel.text = "Price usd \(String(coin.marketData.priceUsd ?? 0.0))"
            infoController.secondNumberLabel.text = "Price btc \(String(coin.marketData.priceBtc ?? 0.0))"
            
            infoController.thirdTextLabel.text = "Change usd last hour \(String(coin.marketData.changeUsdLastHour ?? 0.0))"
            infoController.thirdNumberLabel.text = "Change btc last hour \(String(coin.marketData.changeBtcLastHour ?? 0.0))"
        }
        
        navigationController?.pushViewController(infoController, animated: true)
    }
}
