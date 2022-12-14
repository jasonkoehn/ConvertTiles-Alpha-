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
    @State private var color: Color = Color.blue
    var body: some View {
        Form {
            Toggle("Plus:", isOn: $isPlus)
            ColorPicker("Pick accent color:", selection: $color)
            NavigationLink("About ConvertTiles", destination: AboutView())
        }
        .navigationTitle("Settings")
        .navigationBarItems(trailing: Button(action: {
            saveColor(color: color, key: "accentColor")
            presentationMode.wrappedValue.dismiss()
        }){
            Text("Done")
        })
        .onAppear {
            color = loadColor(key: "accentColor")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
