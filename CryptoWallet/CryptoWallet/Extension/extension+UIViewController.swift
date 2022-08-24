//
//  extension+UIViewController.swift
//  CryptoWallet
//
//  Created by Марк Коваль on 24/07/2022.
//

import UIKit

//MARK: Extension
extension UIViewController {
    
    //MARK: Keyboard
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //MARK: Navigation Bar
    func createCustomNavigationBar() {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9381344914, green: 0.9331676364, blue: 0.9246369004, alpha: 1)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.navigationItem.title = ""
    }
    
    //MARK: Button
    func createCustomButton(titleName: String, selector: Selector) -> UIBarButtonItem {
        
        let button = UIButton(type: .system)
        button.tintColor = #colorLiteral(red: 0.4355629981, green: 0.5685014725, blue: 0.7107543349, alpha: 1)
        button.setTitle(titleName, for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        let menuBarItem =  UIBarButtonItem(customView: button)
        return menuBarItem
    }
}
