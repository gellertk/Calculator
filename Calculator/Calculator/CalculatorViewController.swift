//
//  ViewController.swift
//  Calculator
//
//  Created by Кирилл  Геллерт on 13.04.2022.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    private let calculatorView = CalculatorView()
    
    override func loadView() {
        calculatorView.delegate = self
        view = calculatorView
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        calculatorView.setupLayout()
    }
    
}

extension CalculatorViewController: CalculatorViewDelegate {
    
    
    
}
