//
//  CustomLabel.swift
//  CryptoWallet
//
//  Created by Марк Коваль on 02/08/2022.
//

import UIKit

//MARK: CustomLabel
final class CustomLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: setupView
    private func setupView() {
        backgroundColor = #colorLiteral(red: 0.2101021409, green: 0.2764214873, blue: 0.3264907598, alpha: 1)
        textColor = #colorLiteral(red: 0.9381344914, green: 0.9331676364, blue: 0.9246369004, alpha: 1)
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.2101021409, green: 0.2764214873, blue: 0.3264907598, alpha: 1)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
