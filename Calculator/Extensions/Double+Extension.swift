//
//  Double.swift
//  Calculator
//
//  Created by Кирилл  Геллерт on 29.04.2022.
//

import Foundation

extension Double {
    
    private static var valueFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = " "
        formatter.groupingSize = 3
        formatter.numberStyle = .decimal
        
        return formatter
    }()
    
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
    
    var cleanAndSpaced: String {
        let spaced = self.truncatingRemainder(dividingBy: 1) == 0 ? Double(String(format: "%.0f", self)) : Double(String(self))
        guard let spaced = spaced else {
            return ""
        }
        let number = NSNumber(value: spaced)
        return Double.valueFormatter.string(from: number) ?? ""
    }
    
}
