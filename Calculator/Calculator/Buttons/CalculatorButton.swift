//
//  ActionButton.swift
//  Calculator
//
//  Created by Кирилл  Геллерт on 13.04.2022.
//

import UIKit

class CalculatorButton: UIButton {
    
    private var type: CalculatorButtonType?
    
    private var isZeroNumber: Bool {
        customTitleLabel.text == "0" ? true : false
    }
    
    private lazy var customTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40)
        label.textColor = type?.design.tintColor

        return label
    }()
    
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
        if isZeroNumber {
            layer.cornerRadius = K.Numeric.portraitButtonWidthHeight / 2
        } else {
            layer.cornerRadius = bounds.width / 2
        }
    }
    
}

private extension CalculatorButton {
    
    func setupView() {
        backgroundColor = type?.design.backgroundColor
        tintColor = type?.design.tintColor

        addSubviews([customTitleLabel])
        setupConstraints()
    }
    
    func setupConstraints() {
                
        if isZeroNumber {
            customTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor,
                                                      constant: -50).isActive = true
        } else {
            customTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            widthAnchor.constraint(equalToConstant: K.Numeric.portraitButtonWidthHeight).isActive = true
        }
        
        NSLayoutConstraint.activate([
            customTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            heightAnchor.constraint(equalToConstant: K.Numeric.portraitButtonWidthHeight),
        ])
        
    }
    
}

extension CalculatorButton {
    
    func setImage(from title: String?) {
        
        let largeConfig = UIImage.SymbolConfiguration(pointSize: K.Numeric.portraitButtonWidthHeight / 2.5, weight: .bold)

        if let title = title {
            customTitleLabel.text = title
        } else if let image = UIImage(systemName: type?.imageName ?? "", withConfiguration: largeConfig) {
            setImage(image, for: .normal)
        } else {
            customTitleLabel.text = type?.imageName
        }
        
    }
    
}
