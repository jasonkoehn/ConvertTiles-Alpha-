//
//  Extensions.swift
//  ConvertTiles(Alpha)
//
//  Created by Jason Koehn on 12/13/22.
//

import SwiftUI

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

func saveColor(color: Color, key: String) {
    let color = UIColor(color).cgColor
    if let components = color.components {
        UserDefaults.standard.set(components, forKey: key)
    }
}
func loadColor(key: String) -> Color {
    guard let array = UserDefaults.standard.object(forKey: key) as? [CGFloat] else { return Color.blue }
    let color = Color(.sRGB, red: array[0], green: array[1], blue: array[2], opacity: array[3])
    return color
}
