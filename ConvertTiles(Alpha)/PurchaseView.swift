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
                .font(.system(size: 45))
                .fontDesign(.serif)
                .fontWeight(.semibold)
                .padding(.bottom)
            VStack(spacing: 10) {
                Text("Advantages of pro:")
                    .italic()
                    .font(.system(size: 25))
                Text("20 converter groups.")
                    .foregroundColor(.blue)
                    .font(.system(size: 25))
                    .fontDesign(.rounded)
                Text("More than three tiles at a time.")
                    .foregroundColor(.mint)
                    .font(.system(size: 23))
                Text("More units in the original converter groups.")
                    .foregroundColor(.orange)
                    .font(.system(size: 21))
                Text("Custom Accent Colors.")
                    .foregroundColor(.red)
                    .font(.system(size: 23))
                    .fontDesign(.rounded)
                Text("Custom Unit Selection.")
                    .foregroundColor(.cyan)
                    .font(.system(size: 23))
                    .fontDesign(.serif)
                Text("Single unit selection option.")
                    .foregroundColor(.indigo)
                    .font(.system(size: 23))
                Text("Saving of last used unit.")
                    .foregroundColor(.blue)
                    .font(.system(size: 23))
                Text("And more!")
                    .foregroundColor(.green)
                    .font(.system(size: 25))
                    .fontDesign(.monospaced)
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

