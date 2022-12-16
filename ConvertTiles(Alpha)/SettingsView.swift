//
//  SettingsView.swift
//  ConvertTiles(Alpha)
//
//  Created by Jason Koehn on 12/13/22.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("pro") var pro: Bool = false
    @Binding var accentColor: Color
    
    //Debug
    @AppStorage("HLB") var hasLaunchedBefore: Bool = false
    
    var body: some View {
        Form {
            if pro == false {
                HStack {
                    Text("Get Pro:")
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Text("Upgrade")
                    }
                }
            }
            if pro {
                ColorPicker("Accent Color:", selection: $accentColor)
            } else {
                HStack {
                    Text("Accent Color:")
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Text("Get Pro")
                    }
                }
            }
            NavigationLink("About ConvertTiles", destination: AboutView())
            
            //Debug
            Section("Debug") {
                Toggle("Pro:", isOn: $pro)
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
