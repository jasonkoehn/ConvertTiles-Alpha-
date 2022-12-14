//
//  LaunchView.swift
//  ConvertTiles(Alpha)
//
//  Created by Jason Koehn on 12/14/22.
//

import SwiftUI

struct LaunchView: View {
    @Binding var hasLaunchedBefore: Bool
    var body: some View {
        Button(action: {
            let manager = FileManager.default
            guard let managerUrl = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
            let encoder = PropertyListEncoder()
            let convertersUrl = managerUrl.appendingPathComponent("converters.plist")
            manager.createFile(atPath: convertersUrl.path, contents: nil, attributes: nil)
            let encodedData = try! encoder.encode(basicConverters)
            try! encodedData.write(to: convertersUrl)
            hasLaunchedBefore = true
        }) {
            Text("ok")
        }
    }
}
