//
//  LaunchView.swift
//  ConvertTiles(Alpha)
//
//  Created by Jason Koehn on 12/14/22.
//

import SwiftUI

struct LaunchView: View {
    @Binding var hasLaunchedBefore: Bool
    @State private var presentPurchaseSheet = false
    var body: some View {
        VStack {
            HStack { Spacer() }
            Text("Welcome To")
                .font(.system(size: 45))
                .foregroundColor(.white)
                .fontDesign(.serif)
            Text("ConvertTiles")
                .font(.system(size: 60))
                .foregroundColor(Color(.systemGreen))
                .italic()
                .rotationEffect(Angle(degrees: 356))
                .padding(5)
            Text("An easy to use app where unit converters live on tiles.")
                .font(.system(size: 22))
                .padding(.horizontal, 15)
            Text("Thank you for downloading this app.")
                .font(.system(size: 22))
                .padding(.vertical, 1)
                .italic()
                .foregroundColor(.cyan)
            Text("Enjoy!")
                .font(.system(size: 30))
                .fontDesign(.serif)
                .foregroundColor(.orange)
            Spacer()
            VStack {
                Text("Purchase Pro?")
                    .font(.system(size: 22))
                HStack {
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
                        .frame(width: 163, height: 60)
                        .background(Color(.systemIndigo))
                        .cornerRadius(8)
                    }
                    Spacer()
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
                        .frame(width: 163, height: 60)
                        .background(Color(.systemIndigo))
                        .cornerRadius(8)
                    }
                }
                .frame(width: 340)
                Button(action: {
                    self.presentPurchaseSheet.toggle()
                }) {
                    Text("Learn More")
                        .foregroundColor(.white)
                        .font(.system(size: 23))
                        .italic()
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBrown))
                        .cornerRadius(8)
                }
                Text("Not Ready for Pro?")
                    .font(.system(size: 22))
                    .padding(.top)
                Button(action: {
                    performFirstLaunch()
                }) {
                    Text("Launch App")
                        .foregroundColor(.white)
                        .font(.system(size: 23))
                        .italic()
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .cornerRadius(8)
                }
            }
            Spacer()
        }
        .padding(.vertical, 30)
        .background(Color(.systemGray5))
        .preferredColorScheme(.dark)
        .fullScreenCover(isPresented: $presentPurchaseSheet) {
            NavigationView {
                PurchaseView()
            }
        }
    }
    func performFirstLaunch() {
        let initConverters: [Converter] = [Converter(name: "Length", id: UUID(), group: "Length", unitAmount: "Multiple", units: ["Kilometers", "Decameters", "Meters", "Decimeters", "Centimeters", "Millimeters", "Inches", "Feet", "Yards", "Miles", "Nautical Miles"], inUnit: "Meters", outUnit: "Yards", hasCustomAccentColor: false, customAccentColor: [0.156956285238266, 0.3742818236351013, 0.9598580002784729, 1.0]), Converter(name: "Mass", id: UUID(), group: "Mass", unitAmount: "Multiple", units: ["Kilograms", "Grams", "Milligrams", "Ounces", "Pounds", "MetricTons", "ShortTons"], inUnit: "Kilograms", outUnit: "Pounds", hasCustomAccentColor: false, customAccentColor: [0.156956285238266, 0.3742818236351013, 0.9598580002784729, 1.0])]
        saveToArray(converters: initConverters)
        hasLaunchedBefore = true
    }
}
