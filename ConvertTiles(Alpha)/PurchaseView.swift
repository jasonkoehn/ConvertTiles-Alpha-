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
        VStack {
            Text("Purchase Pro!")
                .font(.system(size: 40))
                .padding(.bottom)
            VStack(alignment: .leading) {
                Text("Advantages of pro:")
                    .italic()
                    .font(.system(size: 20))
                Text("More than three tiles at a time.")
                    .foregroundColor(.mint)
                Text("Many more converter types.")
                    .foregroundColor(.indigo)
                Text("Custom Accent Colors.")
                    .foregroundColor(.red)
                Text("Saving of last used unit.")
                    .foregroundColor(.blue)
            }
            Spacer()
            HStack{ Spacer() }
                Button(action: {
                    // Monthly Purchase Button
                }) {
                    VStack{
                        Text("$0.99")
                            .font(.system(size: 22))
                            .foregroundColor(.black)
                        Text("Per Month")
                            .foregroundColor(.white)
                            .italic()
                    }
                    .frame(width: 330, height: 60)
                    .background(Color(.systemIndigo))
                    .cornerRadius(8)
                }
                Button(action: {
                    // Yearly Purchase Button
                }) {
                    VStack{
                        Text("$9.99")
                            .foregroundColor(.black)
                            .font(.system(size: 22))
                        Text("Per Year")
                            .foregroundColor(.white)
                            .italic()
                    }
                    .frame(width: 330, height: 60)
                    .background(Color(.systemIndigo))
                    .cornerRadius(8)
                }
            Spacer()
        }
        .padding(.vertical, 30)
        .background(Color(.systemGray5))
        .preferredColorScheme(.dark)
            .navigationBarItems(trailing: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 25))
                    .foregroundColor(Color.gray)
                    .frame(width: 20, height: 20)
            })
    }
}

struct PurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PurchaseView()
        }
    }
}

