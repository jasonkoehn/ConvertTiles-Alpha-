//
//  Extensions.swift
//  ConvertTiles(Alpha)
//
//  Created by Jason Koehn on 12/13/22.
//

import Foundation

extension Formatter {
    static let inNumberFormat: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.zeroSymbol  = ""
        return formatter
    }()
}

func FormatNum(from: NSNumber) -> String {
    let formatter = NumberFormatter()
    formatter.minimumFractionDigits = 0
    formatter.maximumFractionDigits = 4
    return formatter.string(from: from)!
}
