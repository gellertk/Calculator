//
//  CalculatorView.swift
//  Calculator
//
//  Created by Кирилл  Геллерт on 13.04.2022.
//

import UIKit

protocol CalculatorViewDelegate: AnyObject {
    func sendSelectedButton(_ button: CalculatorButton)
}

class CalculatorView: UIView {
    
    private lazy var portraitConstraint = [
        resultView.topAnchor.constraint(equalTo: topAnchor),
        resultView.leadingAnchor.constraint(equalTo: buttonsView.leadingAnchor, constant: K.Numeric.portraitButtonWidthHeight / 5),
        resultView.trailingAnchor.constraint(equalTo: buttonsView.trailingAnchor, constant: -K.Numeric.portraitButtonWidthHeight / 5),
        resultView.bottomAnchor.constraint(equalTo: buttonsView.topAnchor, constant: -K.Numeric.portraitButtonWidthHeight / 7),
        
        buttonsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -K.Numeric.portraitButtonWidthHeight / 3.5),
        buttonsView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -K.Numeric.portraitButtonWidthHeight / 2)
    ]
    
    private lazy var landscapeConstraints = [
        resultView.topAnchor.constraint(equalTo: topAnchor),
        resultView.bottomAnchor.constraint(equalTo: buttonsView.topAnchor),
        resultView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
        resultView.trailingAnchor.constraint(equalTo: buttonsView.trailingAnchor, constant: -K.Numeric.portraitButtonWidthHeight / 4),
        resultView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2),
        
        buttonsView.topAnchor.constraint(equalTo: resultView.bottomAnchor),
        buttonsView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        buttonsView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
        buttonsView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
    ]
    
    private var buttonTracked: CalculatorButton?
    
    weak var delegate: CalculatorViewDelegate?
    
    var resultView = ResultView()
    private var buttonsView = ButtonsView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleSubviewWhenTouchBegan(buttonsView.buttonsStackView,
                                    point: touches.first?.location(in: buttonsView.buttonsStackView),
                                    event: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleSubviewWhenTouchMoved(buttonsView.buttonsStackView,
                                    point: touches.first?.location(in: buttonsView.buttonsStackView),
                                    event: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let oldbutton = buttonTracked {
            setupButtonAsSelected(oldbutton)
        }
    }
    
    func setupView() {
        backgroundColor = .black
        addSubviews([resultView,
                     buttonsView])
        setupConstraints()
    }
    
    func setupConstraints() {
        
        UIView.animate(withDuration: 0.2) { [weak self] in
            self?.buttonsView.setupButtonsStackView()
            self?.resultView.setupResultLabel()
        }
        
        if Orientation.isPortrait {
            NSLayoutConstraint.deactivate(landscapeConstraints)
            NSLayoutConstraint.activate(portraitConstraint)
        } else if Orientation.isLandscape {
            NSLayoutConstraint.deactivate(portraitConstraint)
            NSLayoutConstraint.activate(landscapeConstraints)
        }
        
    }
    
}

private extension CalculatorView {
    
    func handleSubviewWhenTouchBegan(_ subview: UIView, point: CGPoint?, event: UIEvent?) {
        guard let point = point else {
            return
        }
        if let subview = subview.hitTest(point, with: event),
           let button = subview as? CalculatorButton {
            setupButtonAsSwipedIn(button)
        }
    }
    
    func handleSubviewWhenTouchMoved(_ subview: UIView, point: CGPoint?, event: UIEvent?) {
        guard let point = point else {
            return
        }
        if let subview = subview.hitTest(point, with: event),
           let button = subview as? CalculatorButton {
            if let oldbutton = buttonTracked, oldbutton != button {
                setupButtonAsSwipedOut(oldbutton)
            } else {
                setupButtonAsSwipedIn(button)
            }
        }
    }
    
    func setupButtonAsSwipedOut(_ button: CalculatorButton) {
        button.sendActions(for: .touchDragExit)
        buttonTracked = nil
    }
    
    func setupButtonAsSwipedIn(_ button: CalculatorButton) {
        button.sendActions(for: .touchDragEnter)
        buttonTracked = button
    }
    
    func setupButtonAsSelected(_ button: CalculatorButton) {
        button.sendActions(for: .touchUpInside)
        delegate?.sendSelectedButton(button)
    }
}
