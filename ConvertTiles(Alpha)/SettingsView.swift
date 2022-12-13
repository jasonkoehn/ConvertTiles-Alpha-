//
//  SettingsView.swift
//  ConvertTiles(Alpha)
//
//  Created by Jason Koehn on 12/13/22.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("appearance") var appearance: String = "System"
    @State private var appearanceSettings = ["System", "Light", "Dark"]
    @AppStorage("plus") var isPro = false
    var body: some View {
        Form {
            Picker("", selection: $appearance) {
                ForEach(appearanceSettings, id: \.self) { setting in
                    Text(setting).tag(setting)
                }
            }
            .pickerStyle(.segmented)
            Toggle("Pro:", isOn: $isPro)
        }
        .navigationTitle("Settings")
        .navigationBarItems(trailing: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }){
            Text("Done")
        })
        .preferredColorScheme(appearance == "System" ? nil : (appearance == "Dark" ? .dark : .light))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
