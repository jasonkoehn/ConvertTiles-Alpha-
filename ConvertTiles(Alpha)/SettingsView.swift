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
    var body: some View {
        VStack {
            Form {
                if pro == false {
                    Button(action: {
                        self.presentPurchaseSheet.toggle()
                    }) {
                        Text("Upgrade to Pro")
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
                            Text("Upgrade")
                        }
                    }
                }
                Section {
                    Button(action: {
                        //Restore Purchase
                        
                        //Debug
                        self.pro.toggle()
                    }) {
                        Text("Restore Purchase")
                    }
                }
            }
            Spacer()
            Text("MIT L icense")
                .font(.system(size: 12))
            Text("© 2023 Jason Koehn")
                .font(.system(size: 12))
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
