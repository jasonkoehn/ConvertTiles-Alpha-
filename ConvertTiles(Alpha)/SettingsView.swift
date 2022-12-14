//
//  SettingsView.swift
//  ConvertTiles(Alpha)
//
//  Created by Jason Koehn on 12/13/22.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("plus") var isPlus = false
    @Binding var accentColor: Color
    var body: some View {
        Form {
            Toggle("Plus:", isOn: $isPlus)
            ColorPicker("Accent Color:", selection: $accentColor)
            NavigationLink("About ConvertTiles", destination: AboutView())
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
