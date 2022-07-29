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
    private let data = City.getCityList()
    private let identifier = "walletCell"
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    // MARK: setUpView
    private func setUpView() {
        
        // NavigationBar
        createCustomNavigationBar()
        
        // BarButton
        let logOutButton = createCustomButton(titleName: "LogOut", selector: #selector(logOutButtonTapped))
        navigationItem.rightBarButtonItem = logOutButton
        
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
        navigationController?.pushViewController(startController, animated: true)
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
        let city = data[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = city.capital
        content.secondaryText = city.country
        
        cell.contentConfiguration = content
        
        return cell
    }
}
