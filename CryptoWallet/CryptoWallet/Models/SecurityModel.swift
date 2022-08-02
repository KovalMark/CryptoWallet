//
//  SecurityModel.swift
//  CryptoWallet
//
//  Created by Марк Коваль on 01/08/2022.
//

import UIKit

struct SecurityModel {
    
    private let startController = StartController()
    
    func plus() {
        let alert = UIAlertController(title: "Ошибка", message: "Неверный логин или пароль", preferredStyle: .actionSheet)
        
        let buttonAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.startController.firstTextField.text?.removeAll()
            self.startController.secondTextField.text?.removeAll()
        }
        alert.addAction(buttonAction)
//        present(alert, animated: true, completion: nil)
    }
}
