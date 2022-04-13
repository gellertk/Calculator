//
//  ActionButton.swift
//  Calculator
//
//  Created by Кирилл  Геллерт on 13.04.2022.
//

import UIKit

class CalculatorButton: UIButton {
    
    private var type: CalculatorButtonType?
    
    init(type: CalculatorButtonType, title: String? = nil) {
        super.init(frame: .zero)
        self.type = type
        setImage(from: title)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if currentTitle != "0" {
            layer.cornerRadius = bounds.width / 2
        }
        else {
            layer.cornerRadius = 40
        }
    }
    
}

private extension CalculatorButton {
    
    func setupView() {
        backgroundColor = type?.superType.backgroundColor
        tintColor = type?.superType.tintColor
        setTitleColor(type?.superType.tintColor, for: .normal)
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 80),
            widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
}

extension CalculatorButton {
    
    func setImage(from title: String?) {
        
        if let title = title {
            setTitle(title, for: .normal)
        } else if let image = UIImage(systemName: type?.imageName ?? "") {
            setImage(image, for: .normal)
        } else {
            setTitle(type?.imageName, for: .normal)
        }
        
        titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        
    }
    
}
