//
//  ActionButton.swift
//  Calculator
//
//  Created by Кирилл  Геллерт on 13.04.2022.
//

import UIKit

class CalculatorButton: UIButton {
    
    private lazy var widthConstraint = widthAnchor.constraint(equalToConstant: K.Numeric.portraitButtonWidthHeight)
    private lazy var heightConstraint = heightAnchor.constraint(equalToConstant: K.Numeric.portraitButtonWidthHeight)

    private var type: CalculatorButtonType?
    
    private var isZeroNumber: Bool {
        customTitleLabel.text == "0" ? true : false
    }
    
    private lazy var customTitleLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = type?.design.tintColor
        if type == .reset {
            label.font = UIFont.systemFont(ofSize: 35, weight: .medium)
        } else {
            label.font = UIFont.systemFont(ofSize: 38)
        }
        
        if type == .reset {
            label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        } else {
            label.font = UIFont.systemFont(ofSize: 15)
        }

        return label
    }()
    
    init(type: CalculatorButtonType, title: String? = nil) {
        super.init(frame: .zero)
        self.type = type
        setTitle(title)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if isZeroNumber {
            layer.cornerRadius = K.Numeric.portraitButtonWidthHeight / 2
            //layer.cornerRadius = bounds.height / 2
        } else {
            layer.cornerRadius = bounds.width / 2
            //layer.cornerRadius = bounds.height / 2
        }
    }
    
    func setupLayout() {
        if Orientation.isLandscape {
//            widthConstraint.isActive = false
//            heightConstraint.isActive = false
//            widthAnchor.constraint(equalToConstant: K.Numeric.portraitButtonWidthHeight / 2).isActive = true
//            heightAnchor.constraint(equalToConstant: K.Numeric.portraitButtonWidthHeight / 2).isActive = true
        } else {
//            heightPortraitConstraint.isActive = true
//            heightLandscapeConstraint.isActive = false
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
        
        //heightConstraint.isActive = true
        customTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
                
        if isZeroNumber {
            customTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor,
                                                      constant: -50).isActive = true
        } else {
            customTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            //widthConstraint.isActive = true
        }
        
    }
    
}

extension CalculatorButton {
    
    func setTitle(_ title: String?) {
        
        var largeConfig: UIImage.SymbolConfiguration
        
        if type?.design == .selfAction {
            largeConfig = UIImage.SymbolConfiguration(pointSize: K.Numeric.portraitButtonWidthHeight / 2.8, weight: .semibold)
        } else {
            largeConfig = UIImage.SymbolConfiguration(pointSize: K.Numeric.portraitButtonWidthHeight / 2.5, weight: .bold)
        }
        
        if let title = title {
            customTitleLabel.text = title
        } else if let image = UIImage(systemName: type?.title ?? "", withConfiguration: largeConfig) {
            setImage(image, for: .normal)
        } else {
            customTitleLabel.text = type?.title
        }
        
    }
    
}
