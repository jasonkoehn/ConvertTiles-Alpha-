//
//  ConvertTiles_Alpha_App.swift
//  ConvertTiles(Alpha)
//
//  Created by Jason Koehn on 12/12/22.
//

import SwiftUI

@main
struct ConvertTiles_Alpha_App: App {
    @AppStorage("HLB") var hasLaunchedBefore: Bool = false
    var body: some Scene {
        WindowGroup {
            TilesPageView()
                .task {
                    if hasLaunchedBefore == false {
                        let manager = FileManager.default
                        guard let managerUrl = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
                        let encoder = PropertyListEncoder()
                        let convertersUrl = managerUrl.appendingPathComponent("converters.plist")
                        manager.createFile(atPath: convertersUrl.path, contents: nil, attributes: nil)
                        let encodedData = try! encoder.encode(basicConverters)
                        try! encodedData.write(to: convertersUrl)
                        hasLaunchedBefore = true
                    }
                }
        }
    }
}
