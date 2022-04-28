//
//  Constant.swift
//  Calculator
//
//  Created by Кирилл  Геллерт on 13.04.2022.
//

import UIKit

struct K {
    
    struct Color {
        
        static let actionButtonBackground: UIColor = .init(red: 255, green: 148, blue: 0)
        static let selfActionButtonBackground: UIColor = .init(red: 116, green: 116, blue: 116)
        static let numberButtonBackground: UIColor = .init(red: 51, green: 51, blue: 51)
        static let engineerButtonBackground: UIColor = .init(red: 33, green: 33, blue: 33)

        static let numberAndEngineeringButtonHighlited: UIColor = .init(red: 115, green: 115, blue: 115)
        static let selfActionButtonHighlited: UIColor = .init(red: 217, green: 217, blue: 217)
        static let actionButtonHighlited: UIColor = .init(red: 251, green: 199, blue: 141)
        
        static let engineeringButtonSelected: UIColor = .init(red: 77, green: 77, blue: 77)

        static let selfActionButtonTitle: UIColor = .black
        static let buttonTitle: UIColor = .white
        
    }
    
    struct Numeric {
        
        static let portraitButtonWidthHeight: CGFloat = UIScreen.main.bounds.width / 5
        static let portraitButtonSpacing: CGFloat = 15
        static let landscapeButtonSpacing: CGFloat = 10
        
        static var spacing: CGFloat {
            if Orientation.isPortrait {
                return portraitButtonSpacing
            }
            return landscapeButtonSpacing
        }
        
        static var resultLabelFontSize: CGFloat {
            if Orientation.isPortrait {
                return portraitButtonWidthHeight * 1.3
            } else {
                return portraitButtonWidthHeight * 0.7
            }
        }

    }
    
}
