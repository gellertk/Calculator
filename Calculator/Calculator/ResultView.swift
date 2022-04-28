//
//  ResultView.swift
//  Calculator
//
//  Created by Кирилл  Геллерт on 20.04.2022.
//

import UIKit

class ResultView: UIView {
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupResultLabel() {
        resultLabel.font = .systemFont(ofSize: K.Numeric.resultLabelFontSize, weight: .light)
    }
    
}

private extension ResultView {
    
    func setupView() {
        backgroundColor = .black
        addSubviews([resultLabel])
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            resultLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            resultLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}
