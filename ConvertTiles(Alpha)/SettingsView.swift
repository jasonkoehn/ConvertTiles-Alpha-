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
    @State private var presentPurchaseSheet = false
    
    //Debug
    @AppStorage("HLB") var hasLaunchedBefore: Bool = false
    
    var body: some View {
        Form {
            if pro == false {
                HStack {
                    Text("Get Pro:")
                    Spacer()
                    Button(action: {
                        self.presentPurchaseSheet.toggle()
                    }) {
                        Text("Upgrade")
                    }
                }
            }
            if pro {
                ColorPicker("Tiles Accent Color:", selection: $accentColor)
            } else {
                HStack {
                    Text("Tiles Accent Color:")
                    Spacer()
                    Button(action: {
                        self.presentPurchaseSheet.toggle()
                    }) {
                        Text("Get Pro")
                    }
                }
            }
            NavigationLink("About ConvertTiles", destination: AboutView())
            
            //Debug
//            Section("Debug") {
//                Toggle("Pro:", isOn: $pro)
//                Toggle("Has Launched Before:", isOn: $hasLaunchedBefore)
//            }
        }
        .navigationTitle("Settings")
        .navigationBarItems(trailing: Button(action: {
            UserDefaults.standard.set(findColorValues(color: accentColor), forKey: "accentColor")
            presentationMode.wrappedValue.dismiss()
        }){
            Text("Save")
        })
        .fullScreenCover(isPresented: $presentPurchaseSheet) {
            NavigationView {
                PurchaseView()
            }
        }
    }
}
