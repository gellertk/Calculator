//
//  ViewController.swift
//  Calculator
//
//  Created by Кирилл  Геллерт on 13.04.2022.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    private var selectedButtons: [CalculatorButton] = []
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    private let calculatorView = CalculatorView()
    
    override func loadView() {
        calculatorView.delegate = self
        view = calculatorView
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        calculatorView.setupConstraints()
    }
    
}

extension CalculatorViewController: CalculatorViewDelegate {
    
    func sendSelectedButton(_ button: CalculatorButton) {
        if button.operation.isDeselectable {
            button.isSelected.toggle()
        } else if button.operation.isSelectable {
            button.isSelected = true
        }
        
//        if button.isSelected {
//            selectedButtons.forEach({
//                $0.isSelected = false
//            })
//            if !selectedButtons.contains(button) {
//                selectedButtons.append(button)
//            }
//        }
        
    }

}
