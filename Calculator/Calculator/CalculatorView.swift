//
//  CalculatorView.swift
//  Calculator
//
//  Created by Кирилл  Геллерт on 13.04.2022.
//

import UIKit

protocol CalculatorViewDelegate: AnyObject {
    
}

class CalculatorView: UIView {
    
    weak var delegate: CalculatorViewDelegate?
    
    private var resultView = ResultView()
    private var keyboardView = KeyboardView()
    
    private lazy var portraitConstraint = [
        resultView.topAnchor.constraint(equalTo: topAnchor),
        resultView.leadingAnchor.constraint(equalTo: leadingAnchor),
        resultView.trailingAnchor.constraint(equalTo: keyboardView.trailingAnchor, constant: -K.Numeric.portraitButtonWidthHeight / 5),
        resultView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
        
        keyboardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
        keyboardView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30),
    ]
    
    private lazy var landscapeConstraints = [
        resultView.topAnchor.constraint(equalTo: topAnchor),
        resultView.bottomAnchor.constraint(equalTo: keyboardView.topAnchor),
        resultView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
        resultView.trailingAnchor.constraint(equalTo: keyboardView.trailingAnchor),
        resultView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2),
        
        keyboardView.topAnchor.constraint(equalTo: resultView.bottomAnchor),
        keyboardView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
        keyboardView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        keyboardView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        setupConstraints()
    }
    
}

private extension CalculatorView {
    
    func setupView() {
        backgroundColor = .black
        addSubviews([resultView,
                     keyboardView])
        setupConstraints()
    }
    
    func setupConstraints() {
        
        keyboardView.setupButtonsStackView()
        resultView.setupResultLabel()
        
        if Orientation.isPortrait {
            NSLayoutConstraint.deactivate(landscapeConstraints)
            NSLayoutConstraint.activate(portraitConstraint)
        } else if Orientation.isLandscape {
            NSLayoutConstraint.deactivate(portraitConstraint)
            NSLayoutConstraint.activate(landscapeConstraints)
        }
        
    }
    
}
