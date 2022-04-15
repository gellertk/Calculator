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
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 100, weight: .light)
        label.textColor = .white
        
        return label
    }()
    
    private let calculatorStackView: UIStackView = {
        
        let bottomStackView = UIStackView(arrangedSubviews: [CalculatorButton(type: .number, title: ","),
                                                             CalculatorButton(type: .equal)],
                                          axis: .horizontal,
                                          spacing: K.Numeric.buttonSpacing,
                                          distribution: .fillEqually)
        
        let rowSubviews = [[CalculatorButton(type: .reset),
                            CalculatorButton(type: .plusMinus),
                            CalculatorButton(type: .percent),
                            CalculatorButton(type: .divide)],
                           
                           [CalculatorButton(type: .number, title: "7"),
                            CalculatorButton(type: .number, title: "8"),
                            CalculatorButton(type: .number, title: "9"),
                            CalculatorButton(type: .multiply)],
                           
                           [CalculatorButton(type: .number, title: "4"),
                            CalculatorButton(type: .number, title: "5"),
                            CalculatorButton(type: .number, title: "6"),
                            CalculatorButton(type: .minus)],
                           
                           [CalculatorButton(type: .number, title: "1"),
                            CalculatorButton(type: .number, title: "2"),
                            CalculatorButton(type: .number, title: "3"),
                            CalculatorButton(type: .plus)],
                           
                           [CalculatorButton(type: .number, title: "0"),
                            bottomStackView]]
                
        let horizontalStackViews = rowSubviews.map { UIStackView(arrangedSubviews: $0,
                                                                 axis: .horizontal,
                                                                 spacing: K.Numeric.buttonSpacing,
                                                                 distribution: .fillEqually)
        }
        
        let stackView = UIStackView(arrangedSubviews: horizontalStackViews,
                                    axis: .vertical,
                                    spacing: K.Numeric.buttonSpacing,
                                    distribution: .fillEqually)
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension CalculatorView {
    
    func setupView() {
        backgroundColor = .black
        addSubviews([resultLabel,
                     calculatorStackView])
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            resultLabel.trailingAnchor.constraint(equalTo: calculatorStackView.trailingAnchor,
                                                  constant: -20),
            resultLabel.bottomAnchor.constraint(equalTo: calculatorStackView.topAnchor,
                                                constant: -30),
            
            calculatorStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,
                                                        constant: -20),
            calculatorStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
}
