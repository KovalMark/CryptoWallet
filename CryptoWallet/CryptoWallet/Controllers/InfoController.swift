//
//  InfoController.swift
//  CryptoWallet
//
//  Created by Марк Коваль on 01/08/2022.
//

import UIKit
import SnapKit

// MARK: InfoController
final class InfoController: UIViewController {
    
    let firstTextLabel = CustomLabel()
    let firstNumberLabel = CustomLabel()
    let secondTextLabel = CustomLabel()
    let secondNumberLabel = CustomLabel()
    let thirdTextLabel = CustomLabel()
    let thirdNumberLabel = CustomLabel()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: setUpView
    func setUpView() {
        
        // NavigationBar
        createCustomNavigationBar()
        
        // ScrollView
        let scroll = UIScrollView()
        scroll.backgroundColor = #colorLiteral(red: 0.2101021409, green: 0.2764214873, blue: 0.3264907598, alpha: 1)
        view.addSubview(scroll)
        scroll.snp.makeConstraints { maker in
            maker.left.top.right.bottom.equalToSuperview().inset(0)
        }
        
        // FirstTextLabel
        firstTextLabel.text = "firstTextLabel"
        scroll.addSubview(firstTextLabel)
        firstTextLabel.snp.makeConstraints { maker in
            maker.centerX.equalTo(scroll)
            maker.top.equalTo(scroll).inset(25)
        }
        
        // FirstNumberLabel
        firstNumberLabel.text = "0"
        scroll.addSubview(firstNumberLabel)
        firstNumberLabel.snp.makeConstraints { maker in
            maker.centerX.equalTo(scroll)
            maker.top.equalTo(firstTextLabel).inset(25)
        }
        
        // SecondTextLabel
        secondTextLabel.text = "secondTextLabel"
        scroll.addSubview(secondTextLabel)
        secondTextLabel.snp.makeConstraints { maker in
            maker.centerX.equalTo(scroll)
            maker.top.equalTo(firstNumberLabel).inset(100)
        }
        
        // SecondNumberLabel
        secondNumberLabel.text = "1"
        scroll.addSubview(secondNumberLabel)
        secondNumberLabel.snp.makeConstraints { maker in
            maker.centerX.equalTo(scroll)
            maker.top.equalTo(secondTextLabel).inset(25)
        }
        
        // ThirdTextLabel
        thirdTextLabel.text = "thirdTextLabel"
        scroll.addSubview(thirdTextLabel)
        thirdTextLabel.snp.makeConstraints { maker in
            maker.centerX.equalTo(scroll)
            maker.top.equalTo(secondNumberLabel).inset(100)
        }
        
        // ThirdNumberLabel
        thirdNumberLabel.text = "2"
        scroll.addSubview(thirdNumberLabel)
        thirdNumberLabel.snp.makeConstraints { maker in
            maker.centerX.equalTo(scroll)
            maker.top.equalTo(thirdTextLabel).inset(25)
            maker.bottom.equalTo(scroll)
        }
    }
}
