//
//  Constant.swift
//  Calculator
//
//  Created by Кирилл  Геллерт on 13.04.2022.
//

import UIKit

struct K {
    
    struct Color {
        
        static let actionButtonBackground = color(from: "#ff9400")
        static let selfActionButtonBackground = color(from: "#a6a6a6")
        static let numberButtonBackground = color(from: "#333333")
        static let engineerButtonBackground = color(from: "#212121")

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
                return 100
            } else {
                return 60
            }
        }
        
//        static var resetButtonFontSize: CGFloat {
//            if Orientation.isLandscape {
//                label.
//            }
//        }
        
    }
    
//    if type == .reset {
//        label.font = UIFont.systemFont(ofSize: 35, weight: .medium)
//    } else {
//        label.font = UIFont.systemFont(ofSize: 38)
//    }
//    
//    if type == .reset {
//        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
//    } else {
//        label.font = UIFont.systemFont(ofSize: 15)
//    }

    
}

struct Orientation {
    // indicate current device is in the LandScape orientation
    static var isLandscape: Bool {
        get {
            return UIDevice.current.orientation.isValidInterfaceOrientation
                ? UIDevice.current.orientation.isLandscape
                : (UIApplication.shared.windows.first?.windowScene?.interfaceOrientation.isLandscape)!
        }
    }
    // indicate current device is in the Portrait orientation
    static var isPortrait: Bool {
        get {
            return UIDevice.current.orientation.isValidInterfaceOrientation
                ? UIDevice.current.orientation.isPortrait
                : (UIApplication.shared.windows.first?.windowScene?.interfaceOrientation.isPortrait)!
        }
    }
}
