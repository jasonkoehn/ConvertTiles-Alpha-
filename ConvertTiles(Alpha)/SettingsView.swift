//
//  SettingsView.swift
//  ConvertTiles(Alpha)
//
//  Created by Jason Koehn on 12/13/22.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("plus") var isPlus: Bool = false
    @Binding var accentColor: Color
    
    //Debug
    @AppStorage("HLB") var hasLaunchedBefore: Bool = false
    
    var body: some View {
        Form {
            Toggle("Plus:", isOn: $isPlus)
            if isPlus {
                ColorPicker("Accent Color:", selection: $accentColor)
            }
            NavigationLink("About ConvertTiles", destination: AboutView())
            
            //Debug
            Section("Debug") {
                Toggle("Has Launched Before:", isOn: $hasLaunchedBefore)
            }
        }
        .navigationTitle("Settings")
        .navigationBarItems(trailing: Button(action: {
            saveColor(color: accentColor, key: "accentColor")
            presentationMode.wrappedValue.dismiss()
        }){
            Text("Save")
        })
    }
}
