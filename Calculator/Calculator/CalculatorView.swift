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
    
    private lazy var heightPortraitConstraint = topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4)
    private lazy var heightLandscapeConstraint = topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2)
    
    weak var delegate: CalculatorViewDelegate?
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 100, weight: .light)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let topImageContainerView = UIView()
    
    private func getArrangedSubviews() -> [[UIView]] {
        
        if Orientation.isPortrait {
            
            let bottomRowStackView = UIStackView(arrangedSubviews: [
                CalculatorButton(type: .number, title: ","),
                CalculatorButton(type: .equal)
            ],
                                                 axis: .horizontal,
                                                 spacing: K.Numeric.buttonSpacing,
                                                 distribution: .fillEqually)
            
            return [
                [CalculatorButton(type: .reset),
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
                 bottomRowStackView]
            ]
            
        } else {
            
            let bottomRowStackView = UIStackView(arrangedSubviews: [
                CalculatorButton(type: .rad),
                CalculatorButton(type: .sinh),
                CalculatorButton(type: .cosh),
                CalculatorButton(type: .tanh),
                CalculatorButton(type: .pi),
                CalculatorButton(type: .rand)
            ],
                                                 axis: .horizontal,
                                                 spacing: K.Numeric.buttonSpacing,
                                                 distribution: .fillEqually)
            
            let endStackView = UIStackView(arrangedSubviews: [
                CalculatorButton(type: .number, title: ","),
                CalculatorButton(type: .equal)
            ],
                                           axis: .horizontal,
                                           spacing: K.Numeric.buttonSpacing,
                                           distribution: .fillEqually)
            
            return [
                [CalculatorButton(type: .leftBracket),
                 CalculatorButton(type: .rightBracket),
                 CalculatorButton(type: .mc),
                 CalculatorButton(type: .mPlus),
                 CalculatorButton(type: .mMinus),
                 CalculatorButton(type: .mr),
                 CalculatorButton(type: .reset),
                 CalculatorButton(type: .plusMinus),
                 CalculatorButton(type: .percent),
                 CalculatorButton(type: .divide)],
                
                [CalculatorButton(type: .twoNd),
                 CalculatorButton(type: .x2),
                 CalculatorButton(type: .x3),
                 CalculatorButton(type: .xY),
                 CalculatorButton(type: .eX),
                 CalculatorButton(type: .tenX),
                 CalculatorButton(type: .number, title: "7"),
                 CalculatorButton(type: .number, title: "8"),
                 CalculatorButton(type: .number, title: "9"),
                 CalculatorButton(type: .multiply)],
                
                [CalculatorButton(type: .oneDivide),
                 CalculatorButton(type: .sqrt2),
                 CalculatorButton(type: .sqrt3),
                 CalculatorButton(type: .sqrtY),
                 CalculatorButton(type: .ln),
                 CalculatorButton(type: .logTen),
                 CalculatorButton(type: .number, title: "4"),
                 CalculatorButton(type: .number, title: "5"),
                 CalculatorButton(type: .number, title: "6"),
                 CalculatorButton(type: .minus)],
                
                [CalculatorButton(type: .factorial),
                 CalculatorButton(type: .sin),
                 CalculatorButton(type: .cos),
                 CalculatorButton(type: .tan),
                 CalculatorButton(type: .e),
                 CalculatorButton(type: .ee),
                 CalculatorButton(type: .number, title: "1"),
                 CalculatorButton(type: .number, title: "2"),
                 CalculatorButton(type: .number, title: "3"),
                 CalculatorButton(type: .plus)],
                
                [bottomRowStackView,
                CalculatorButton(type: .number, title: "0"),
                 endStackView
                ]
            ]
        }
    }
    
    private lazy var buttonStackView: UIStackView = {
        //backgroundColor = .cyan
        
        let arrangedSubviews = getArrangedSubviews()
        
        let horizontalStackViews = arrangedSubviews.map { UIStackView(arrangedSubviews: $0,
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
    
    func setupLayout() {
        if Orientation.isLandscape {
            heightLandscapeConstraint.isActive = true
            heightPortraitConstraint.isActive = false
            resultLabel.font = UIFont.systemFont(ofSize: 50, weight: .medium)
//            if let stackViews = buttonStackView.arrangedSubviews as? [UIStackView] {
//                for stackView in stackViews {
//                    for button in stackView.arrangedSubviews {
//                        if let button = button as? CalculatorButton {
//                            //button.setupLayout()
//                            //button.layoutSubviews()
//                        }
//                    }
//                }
//            }
            //layoutIfNeeded()
            
        } else {
            resultLabel.font = UIFont.systemFont(ofSize: 100, weight: .light)
            
            heightPortraitConstraint.isActive = true
            heightLandscapeConstraint.isActive = false
        }
    }
    
}

private extension CalculatorView {
    
    func setupView() {
        backgroundColor = .black
        
        topImageContainerView.backgroundColor = .blue
        topImageContainerView.addSubview(resultLabel)
        
        addSubviews([topImageContainerView,
                     buttonStackView])
        setupConstraints()
        setupLayout()
    }
    
    func setupConstraints() {
        
        heightPortraitConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            
            topImageContainerView.topAnchor.constraint(equalTo: topAnchor),
            topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            resultLabel.bottomAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 10),
            resultLabel.trailingAnchor.constraint(equalTo: topImageContainerView.safeAreaLayoutGuide.trailingAnchor),
            
            buttonStackView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
    
}
