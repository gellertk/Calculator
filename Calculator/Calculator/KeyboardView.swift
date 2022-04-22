//
//  KeyboardView.swift
//  Calculator
//
//  Created by Кирилл  Геллерт on 20.04.2022.
//

import UIKit

class KeyboardView: UIView {
    
    private var firstRowButtons: [UIView] = {
        
        return [CalculatorButton(operation: .leftBracket),
                CalculatorButton(operation: .rightBracket),
                CalculatorButton(operation: .mc),
                CalculatorButton(operation: .mPlus),
                CalculatorButton(operation: .mMinus),
                CalculatorButton(operation: .mr),
                CalculatorButton(operation: .reset, title: "AC"),
                CalculatorButton(operation: .plusMinus),
                CalculatorButton(operation: .percent),
                CalculatorButton(operation: .divide)]
    }()
    
    private var secondRowButtons: [UIView] = {

        return [CalculatorButton(operation: .twoNd),
                CalculatorButton(operation: .x2),
                CalculatorButton(operation: .x3),
                CalculatorButton(operation: .xY),
                CalculatorButton(operation: .eX),
                CalculatorButton(operation: .tenX),
                CalculatorButton(operation: .number, title: "7"),
                CalculatorButton(operation: .number, title: "8"),
                CalculatorButton(operation: .number, title: "9"),
                CalculatorButton(operation: .multiply)]
    }()
    
    private var thirdRowButtons: [UIView] = {
        
        return [CalculatorButton(operation: .oneDivide),
                CalculatorButton(operation: .sqrt2),
                CalculatorButton(operation: .sqrt3),
                CalculatorButton(operation: .sqrtY),
                CalculatorButton(operation: .ln),
                CalculatorButton(operation: .logTen),
                CalculatorButton(operation: .number, title: "4"),
                CalculatorButton(operation: .number, title: "5"),
                CalculatorButton(operation: .number, title: "6"),
                CalculatorButton(operation: .minus)]
    }()
    
    private var fourthRowButtons: [UIView] = {
        
        return [CalculatorButton(operation: .factorial),
                CalculatorButton(operation: .sin),
                CalculatorButton(operation: .cos),
                CalculatorButton(operation: .tan),
                CalculatorButton(operation: .e),
                CalculatorButton(operation: .ee),
                CalculatorButton(operation: .number, title: "1"),
                CalculatorButton(operation: .number, title: "2"),
                CalculatorButton(operation: .number, title: "3"),
                CalculatorButton(operation: .plus)]
    }()
    
    private var fifthRowButtons: [UIView] = {

        let stackView1 = UIStackView(arrangedSubviews: [
            CalculatorButton(operation: .rad),
            CalculatorButton(operation: .sinh)
        ],
                                     axis: .horizontal,
                                     spacing: K.Numeric.spacing,
                                     distribution: .fillEqually)
        
        let stackView2 = UIStackView(arrangedSubviews: [
            CalculatorButton(operation: .cosh),
            CalculatorButton(operation: .tanh)
        ],
                                     axis: .horizontal,
                                     spacing: K.Numeric.spacing,
                                     distribution: .fillEqually)
        
        let stackView3 = UIStackView(arrangedSubviews: [
            CalculatorButton(operation: .pi),
            CalculatorButton(operation: .rand)
        ],
                                     axis: .horizontal,
                                     spacing: K.Numeric.spacing,
                                     distribution: .fillEqually)
        
        let stackView4 = UIStackView(arrangedSubviews: [
            CalculatorButton(operation: .number, title: ","),
            CalculatorButton(operation: .equal)
        ],
                                     axis: .horizontal,
                                     spacing: K.Numeric.spacing,
                                     distribution: .fillEqually)
        
        return [stackView1,
                stackView2,
                stackView3,
                CalculatorButton(operation: .number, title: "0"),
                stackView4]
    }()
    
    private lazy var rowsStackView: [UIStackView] = {
        
        return  [firstRowButtons,
                 secondRowButtons,
                 thirdRowButtons,
                 fourthRowButtons,
                 fifthRowButtons].map {
            
            UIStackView(arrangedSubviews: $0,
                        axis: .horizontal,
                        spacing: K.Numeric.spacing,
                        distribution: .fillEqually)
        }
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        
        return UIStackView(arrangedSubviews: rowsStackView,
                           axis: .vertical,
                           spacing: K.Numeric.spacing,
                           distribution: .fillEqually)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButtonsStackView() {
        
        buttonsStackView.spacing = K.Numeric.spacing
        for view in rowsStackView {
            view.spacing = K.Numeric.spacing
        }
            
        let allButtons: [CalculatorButton] = self.allSubviews(of: CalculatorButton.self)
        
        for row in 0...2 {
            self.fifthRowButtons[row].isHidden = Orientation.isPortrait
        }
        
        for button in allButtons {
            button.setup()
        }
    }
    
}

private extension KeyboardView {
    
    func setupView() {
        backgroundColor = .black
        addSubviews([buttonsStackView])
        setupConstraints()
        setupButtonsStackView()
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: topAnchor),
            buttonsStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            buttonsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
    }
    
}
