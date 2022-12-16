//
//  LaunchView.swift
//  ConvertTiles(Alpha)
//
//  Created by Jason Koehn on 12/14/22.
//

import SwiftUI

struct LaunchView: View {
    @Binding var hasLaunchedBefore: Bool
    var initConverters: [Converter] = [Converter(name: "Length", id: UUID(), group: "Length", unitAmount: "Multiple", units: ["Kilometers", "Decameters", "Meters", "Decimeters", "Centimeters", "Millimeters", "Inches", "Feet", "Yards", "Miles", "Nautical Miles"], inUnit: "Meters", outUnit: "Yards"), Converter(name: "Mass", id: UUID(), group: "Mass", unitAmount: "Multiple", units: ["Kilograms", "Grams", "Milligrams", "Ounces", "Pounds", "MetricTons", "ShortTons"], inUnit: "Kilograms", outUnit: "Pounds")]
    var body: some View {
        Button(action: {
            let manager = FileManager.default
            guard let managerUrl = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
            let encoder = PropertyListEncoder()
            let convertersUrl = managerUrl.appendingPathComponent("converters.plist")
            manager.createFile(atPath: convertersUrl.path, contents: nil, attributes: nil)
            let encodedData = try! encoder.encode(initConverters)
            try! encodedData.write(to: convertersUrl)
            hasLaunchedBefore = true
        }) {
            Text("ok")
        }
    }
}
