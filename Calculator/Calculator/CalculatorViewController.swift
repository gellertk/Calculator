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
    
    private var selectedButtons: [CalculatorButton] = []
    private var currentButton: CalculatorButton!
    
    private var secondOperand: Double?
    private var firstOperand: Double?
    private var storedOperation: Operation?
    private var result: Double = 0.0 {
        didSet {
            if result == .infinity {
                calculatorView.resultView.setResult("Ошибка")
            } else {
                calculatorView.resultView.setResult(result.cleanAndSpaced)
            }
        }
    }
    private var resultString: String = ""
    private var startTyping = false
    
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
        currentButton = button
        
        if button.operation.isDeselectable {
            button.isSelected.toggle()
        } else if button.operation.isSelectable {
            button.isSelected = true
        }
        
        deselectButtons()
        handleOperation()
    }
    
    func deselectButtons() {
        if currentButton.operation.buttonShouldDeselectOther {
            for (index, prevSelected) in selectedButtons.enumerated() {
                if currentButton != prevSelected {
                    prevSelected.isSelected = false
                    selectedButtons.remove(at: index)
                }
            }
            if currentButton.isSelected {
                if !selectedButtons.contains(currentButton) {
                    selectedButtons.append(currentButton)
                }
            }
        }
    }
    
    func handleOperation() {
        
        switch currentButton.operation.buttonType {
        case _ where currentButton.operation == .reset:
            firstOperand = nil
            storedOperation = nil
            result = 0
        case _ where currentButton.operation == .equal:
            calculate()
        case _ where currentButton.operation == .plusMinus:
            result = result * -1
        case _ where currentButton.operation == .percent:
            result = result * 0.01
        case .number:
            concatenate()
            secondOperand = result
        case .action:
            storedOperation = currentButton.operation
            firstOperand = result
        default:
            break
        }
        
        startTyping = currentButton.operation.buttonType == .action
    }
    
    func concatenate() {
        if currentButton.getLabelValue() == "," {
            addComma()
        } else if resultString.hasSuffix(".") {
            result = Double("\(result.clean)\(currentButton.getLabelValue())") ?? 0
            //result = result + Double(currentButton.getLabelValue())! / pow(10, Double(String(result).count - 2))
        } else if result == 0 || startTyping {
            result = Double(currentButton.getLabelValue()) ?? 0
        } else {
            result = Double("\(result.clean)\(currentButton.getLabelValue())") ?? 0
        }
        //if String(result.clean).count < 9, Orientation.isPortrait
    }
    
    func calculate() {
        guard let firstOperand = firstOperand,
              let secondOperand = secondOperand else {
            return
        }
        
        switch storedOperation {
        case .divide:
            result = firstOperand / secondOperand
        case .multiply:
            result = firstOperand * secondOperand
        case .minus:
            result = firstOperand - secondOperand
        case .plus:
            result = firstOperand + secondOperand
        default:
            break
        }
        
        self.firstOperand = result
    }
    
    func addComma() {
        resultString = String(String(result).dropLast())
        calculatorView.resultView.setResult(resultString)
    }
    
}
