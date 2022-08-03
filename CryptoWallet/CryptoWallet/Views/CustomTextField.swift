//
//  TextFieldView.swift
//  CryptoWallet
//
//  Created by Марк Коваль on 24/07/2022.
//

import UIKit

//MARK: TextFieldView
final class CustomTextField: UITextField, UITextFieldDelegate {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: setupView
    private func setupView() {
        backgroundColor = #colorLiteral(red: 0.9381344914, green: 0.9331676364, blue: 0.9246369004, alpha: 1)
        textColor = #colorLiteral(red: 0.1599435508, green: 0.185090214, blue: 0.167404592, alpha: 1)
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.1599435508, green: 0.185090214, blue: 0.167404592, alpha: 1)
        layer.cornerRadius = 10
        borderStyle = .roundedRect
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: frame.height))
        leftViewMode = .always
        clearButtonMode = .always
        returnKeyType = .done
        translatesAutoresizingMaskIntoConstraints = false
    }
}
