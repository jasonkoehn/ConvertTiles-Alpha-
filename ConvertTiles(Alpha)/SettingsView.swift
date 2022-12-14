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
    var body: some View {
        Form {
            Toggle("Plus:", isOn: $isPlus)
            NavigationLink("About ConvertTiles", destination: AboutView())
        }
        .navigationTitle("Settings")
        .navigationBarItems(trailing: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }){
            Text("Done")
        })
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
