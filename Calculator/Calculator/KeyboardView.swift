//
//  KeyboardView.swift
//  Calculator
//
//  Created by Кирилл  Геллерт on 20.04.2022.
//

import UIKit

class KeyboardView: UIView {
    
    private var firstRowButtons: [UIView] = {
        
        return [CalculatorButton(type: .leftBracket),
                CalculatorButton(type: .rightBracket),
                CalculatorButton(type: .mc),
                CalculatorButton(type: .mPlus),
                CalculatorButton(type: .mMinus),
                CalculatorButton(type: .mr),
                CalculatorButton(type: .reset),
                CalculatorButton(type: .plusMinus),
                CalculatorButton(type: .percent),
                CalculatorButton(type: .divide)]
    }()
    
    private var secondRowButtons: [UIView] = {

        return [CalculatorButton(type: .twoNd),
                CalculatorButton(type: .x2),
                CalculatorButton(type: .x3),
                CalculatorButton(type: .xY),
                CalculatorButton(type: .eX),
                CalculatorButton(type: .tenX),
                CalculatorButton(type: .number, title: "7"),
                CalculatorButton(type: .number, title: "8"),
                CalculatorButton(type: .number, title: "9"),
                CalculatorButton(type: .multiply)]
    }()
    
    private var thirdRowButtons: [UIView] = {
        
        return [CalculatorButton(type: .oneDivide),
                CalculatorButton(type: .sqrt2),
                CalculatorButton(type: .sqrt3),
                CalculatorButton(type: .sqrtY),
                CalculatorButton(type: .ln),
                CalculatorButton(type: .logTen),
                CalculatorButton(type: .number, title: "4"),
                CalculatorButton(type: .number, title: "5"),
                CalculatorButton(type: .number, title: "6"),
                CalculatorButton(type: .minus)]
    }()
    
    private var fourthRowButtons: [UIView] = {
        
        return [CalculatorButton(type: .factorial),
                CalculatorButton(type: .sin),
                CalculatorButton(type: .cos),
                CalculatorButton(type: .tan),
                CalculatorButton(type: .e),
                CalculatorButton(type: .ee),
                CalculatorButton(type: .number, title: "1"),
                CalculatorButton(type: .number, title: "2"),
                CalculatorButton(type: .number, title: "3"),
                CalculatorButton(type: .plus)]
    }()
    
    private var fifthRowButtons: [UIView] = {

        let stackView1 = UIStackView(arrangedSubviews: [
            CalculatorButton(type: .rad),
            CalculatorButton(type: .sinh)
        ],
                                     axis: .horizontal,
                                     spacing: K.Numeric.spacing,
                                     distribution: .fillEqually)
        
        let stackView2 = UIStackView(arrangedSubviews: [
            CalculatorButton(type: .cosh),
            CalculatorButton(type: .tanh)
        ],
                                     axis: .horizontal,
                                     spacing: K.Numeric.spacing,
                                     distribution: .fillEqually)
        
        let stackView3 = UIStackView(arrangedSubviews: [
            CalculatorButton(type: .pi),
            CalculatorButton(type: .rand)
        ],
                                     axis: .horizontal,
                                     spacing: K.Numeric.spacing,
                                     distribution: .fillEqually)
        
        let stackView4 = UIStackView(arrangedSubviews: [
            CalculatorButton(type: .number, title: ","),
            CalculatorButton(type: .equal)
        ],
                                     axis: .horizontal,
                                     spacing: K.Numeric.spacing,
                                     distribution: .fillEqually)
        
        return [stackView1,
                stackView2,
                stackView3,
                CalculatorButton(type: .number, title: "0"),
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
        
        UIView.animate(withDuration: 0.2) {
            let allButtons: [CalculatorButton] = self.allSubviews(of: CalculatorButton.self)
            
            for button in allButtons {
                button.setup()
            }
                        
            for row in 0...2 {
                self.fifthRowButtons[row].isHidden = Orientation.isPortrait
            }
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
