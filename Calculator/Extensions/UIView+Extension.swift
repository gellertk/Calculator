//
//  UIViewExtension.swift
//  Calculator
//
//  Created by Кирилл  Геллерт on 13.04.2022.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: [UIView]) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    func allSubviews<T : UIView>(of type : T.Type) -> [T] {
        var all: [T] = []
        func getSubview(view: UIView) {
            if let aView = view as? T {
                all.append(aView)
            }
            guard view.subviews.count > 0 else {
                return
            }
            view.subviews.forEach{
                getSubview(view: $0)
            }
        }
        getSubview(view: self)
        return all
    }
    
    var allCalculatorButtons: [CalculatorButton] {
        return allSubviews(of: CalculatorButton.self) as [CalculatorButton]
    }
    
}


