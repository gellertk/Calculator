//
//  ViewController.swift
//  Calculator
//
//  Created by Кирилл  Геллерт on 13.04.2022.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    override func loadView() {
        let customView = CalculatorView()
        customView.delegate = self
        view = customView
    }
    
}

extension CalculatorViewController: CalculatorViewDelegate {
    
    
    
}
