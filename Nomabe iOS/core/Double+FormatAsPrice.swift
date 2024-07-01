//
//  Double+FormatAsPrice.swift
//  Nomabe iOS
//
//  Created by Piton on 01/07/24.
//

import Foundation

extension Double {
    func formatAsPrice(locale: Locale = Locale(identifier: "pt_BR"), currencySymbol: String = "R$") -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = locale
        formatter.currencySymbol = currencySymbol
        
        if let doubleValue = Double(self.description) {
            return formatter.string(from: NSNumber(value: doubleValue)) ?? ""
        } else {
            // Handle cases where the value is not convertible to Double
            return "Invalid value"
        }
    }
}
