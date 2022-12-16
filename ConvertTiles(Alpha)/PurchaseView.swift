//
//  PurchaseView.swift
//  ConvertTiles(Alpha)
//
//  Created by Jason Koehn on 12/16/22.
//

import SwiftUI

struct PurchaseView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Text("Purchase Pro!")
            .navigationBarItems(trailing:
                                    Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 25))
                    .foregroundColor(Color.gray)
                    .frame(width: 20, height: 20)
                    .background(Color.white)
            }
            )
    }
}

struct PurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseView()
    }
}

