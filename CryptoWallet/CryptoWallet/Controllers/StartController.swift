//
//  StartController.swift
//  CryptoWallet
//
//  Created by Марк Коваль on 24/07/2022.
//

import UIKit
import SnapKit

// MARK: StartController
final class StartController: UIViewController {
    
    private let firstTextField = TextFieldView()
    private let secondTextField = TextFieldView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCustomNavigationBar()
        setUpView()
        self.hideKeyboard()
    }
    
    // MARK: setUpView
    private func setUpView() {
        
        // ScrollView
        let scroll = UIScrollView()
        scroll.backgroundColor = #colorLiteral(red: 0.1599435508, green: 0.185090214, blue: 0.167404592, alpha: 1)
        view.addSubview(scroll)
        scroll.snp.makeConstraints { maker in
            maker.left.top.right.bottom.equalToSuperview().inset(0)
        }
        
        // Image
        let image = UIImageView()
        image.image = UIImage(named: "startImage")
        image.contentMode = .scaleAspectFill
        scroll.addSubview(image)
        image.snp.makeConstraints { maker in
            maker.centerX.equalTo(scroll)
            maker.top.equalTo(scroll).inset(150)
            maker.height.width.equalTo(150)
        }
        
        // FirstTextField
        let firstTextField = firstTextField
        firstTextField.keyboardType = .default
        scroll.addSubview(firstTextField)
        firstTextField.snp.makeConstraints { maker in
            maker.centerX.equalTo(scroll)
            maker.top.equalTo(image).inset(200)
            maker.left.right.equalTo(100)
        }
        
        // SecondTextField
        let secondTextField = secondTextField
        secondTextField.keyboardType = .numberPad
        secondTextField.isSecureTextEntry = true
        scroll.addSubview(secondTextField)
        secondTextField.snp.makeConstraints { maker in
            maker.centerX.equalTo(scroll)
            maker.top.equalTo(firstTextField).inset(50)
            maker.left.right.equalTo(100)
        }
        
        // LogInButton
        let logInButton = UIButton(type: .system)
        logInButton.backgroundColor = #colorLiteral(red: 0.2101021409, green: 0.2764214873, blue: 0.3264907598, alpha: 1)
        logInButton.tintColor = #colorLiteral(red: 0.9333336949, green: 0.9333330989, blue: 0.9204021096, alpha: 1)
        logInButton.layer.cornerRadius = 10
        logInButton.setTitle("LogIn", for: .normal)
        logInButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        scroll.addSubview(logInButton)
        logInButton.snp.makeConstraints { maker in
            maker.centerX.equalTo(scroll)
            maker.top.equalTo(secondTextField).inset(100)
            maker.left.right.equalTo(100)
            maker.bottom.equalTo(scroll)
        }
    }
    
    @objc private func tapButton() {
        let walletController = WalletController()
        walletController.modalPresentationStyle = .fullScreen
        
        if firstTextField.text == "A" && secondTextField.text == "0" {
            navigationController?.pushViewController(walletController, animated: true)
        } else {
            let alert = UIAlertController(title: "Ошибка", message: "Неверный логин или пароль", preferredStyle: .actionSheet)
            
            let buttonAction = UIAlertAction(title: "Ok", style: .default) { _ in
                self.firstTextField.text?.removeAll()
                self.secondTextField.text?.removeAll()
            }
            alert.addAction(buttonAction)
            present(alert, animated: true, completion: nil)
        }
    }
}
