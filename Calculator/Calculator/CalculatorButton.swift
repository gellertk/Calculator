//
//  ActionButton.swift
//  Calculator
//
//  Created by Кирилл  Геллерт on 13.04.2022.
//

import UIKit

class CalculatorButton: UIButton {
        
    var type: CalculatorButtonType = .equal
    
    private lazy var widthPortraitConstraint = widthAnchor.constraint(equalToConstant: K.Numeric.portraitButtonWidthHeight)
    private lazy var heightPortraitConstraint = heightAnchor.constraint(equalToConstant: K.Numeric.portraitButtonWidthHeight)
        
    private var isZeroButton: Bool {
        customTitleLabel.text == "0" ? true : false
    }
    
    private lazy var customTitleLabel: UILabel = {
        let label = UILabel()
        label.font = type.design.font
        label.textColor = type.design.tintColor
        
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
        if isZeroButton {
            if Orientation.isLandscape {
                layer.cornerRadius = bounds.height / 2
            } else {
                layer.cornerRadius = K.Numeric.portraitButtonWidthHeight / 2
            }
        } else {
            if Orientation.isLandscape {
                layer.cornerRadius = bounds.height / 2
            } else {
                layer.cornerRadius = K.Numeric.portraitButtonWidthHeight / 2
            }
        }
    }
    
    func setup() {
        customTitleLabel.font = type.design.font
        if type.design == .engineering {
            isHidden = Orientation.isPortrait
        }
        
        if !isZeroButton {
            heightPortraitConstraint.isActive = Orientation.isPortrait
            widthPortraitConstraint.isActive = Orientation.isPortrait
        }
    }
    
}

private extension CalculatorButton {
    
    func setupView() {
        backgroundColor = type.design.backgroundColor
        tintColor = type.design.tintColor
        addSubviews([customTitleLabel])
        setupConstraints()
    }
    
    func setTitle(_ title: String?) {
        
        if let title = title {
            customTitleLabel.text = title
        } else {
            customTitleLabel.text = type.title
        }
        
    }
    
    func setupConstraints() {
        
        if isZeroButton {
            customTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                      constant: K.Numeric.portraitButtonWidthHeight / 2.3).isActive = true
        } else {
            customTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        }
        
        NSLayoutConstraint.activate([
            customTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            customTitleLabel.heightAnchor.constraint(equalToConstant: K.Numeric.portraitButtonWidthHeight / 2)
        ])
        
    }
    
}

//widthAnchor.constraint(equalToConstant: K.Numeric.portraitButtonWidthHeight * 2 + K.Numeric.spacing).isActive = true
