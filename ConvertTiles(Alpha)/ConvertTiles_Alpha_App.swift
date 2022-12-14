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
            if hasLaunchedBefore {
                TilesPageView()
            } else {
                LaunchView(hasLaunchedBefore: $hasLaunchedBefore)
            }
        }
    }
}
