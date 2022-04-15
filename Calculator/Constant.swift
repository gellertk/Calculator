//
//  Constant.swift
//  Calculator
//
//  Created by Кирилл  Геллерт on 13.04.2022.
//

import UIKit

struct K {
    
    struct Color {
        
        static let actionButtonBackground: UIColor = color(from: "#ff9400")
        static let selfActionButtonBackground: UIColor = color(from: "#a6a6a6")
        static let numberButtonBackground: UIColor = color(from: "#333333")
        static let engineerButtonBackground: UIColor = color(from: "#212121")

        static let selfActionButtonTitle: UIColor = .black
        static let buttonTitle: UIColor = .white
        
    }
    
    struct Numeric {
        
        static let portraitButtonWidthHeight: CGFloat = UIScreen.main.bounds.width / 5
        static let buttonSpacing: CGFloat = 15
        
    }
    
}
