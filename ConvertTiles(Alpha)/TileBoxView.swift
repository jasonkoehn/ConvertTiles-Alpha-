//
//  TileBoxView.swift
//  ConvertTiles(Alpha)
//
//  Created by Jason Koehn on 12/13/22.
//

import SwiftUI

struct TileBoxView: View {
    var name: String
    var id: UUID
    var units: [String]
    var group: String
    var unitAmount: String
    @State var inUnit: String
    @State var outUnit: String
    @FocusState var isInputActive: Bool
    @State var firstAmount: Double = 1
    @Binding var accentColor: Color
    var hasCustomAccentColor: Bool
    var customAccentColor: Color
    @Binding var saveUnits: Bool
    @Binding var newUnits: [NewUnits]
    @Binding var numOfUnits: Int
    @AppStorage("pro") var pro: Bool = false
    var body: some View {
        VStack {
            Text(name)
                .font(.system(size: 25))
                .frame(height: 20)
                .padding(.top, 15)
            HStack {
                Spacer().overlay {
                    VStack {
                        if unitAmount == "Single" {
                            Text(inUnit)
                                .foregroundColor(hasCustomAccentColor ? customAccentColor : accentColor)
                                .padding(.vertical, 5)
                        } else {
                            Picker("Unit", selection: $inUnit) {
                                ForEach(units, id: \.self) { unit in
                                    Text(unit).tag(unit)
                                }
                            }
                            .pickerStyle(.menu)
                            .padding(.vertical, 5)
                            .accentColor(hasCustomAccentColor ? customAccentColor : accentColor)
                        }
                        TextField("Value", value: $firstAmount, formatter: Formatter.inNumberFormat)
                            .onTapGesture {
                                firstAmount = 0
                            }
                            .onChange(of: isInputActive) { input in
                                if input == false {
                                    firstAmount = 1
                                }
                            }
                            .keyboardType(.decimalPad)
                            .textFieldStyle(.roundedBorder)
                            .focused($isInputActive)
                            .frame(width: 100)
                    }
                }
                Button(action: {
                    if pro {
                        let inu = inUnit
                        let outu = outUnit
                        inUnit = outu
                        outUnit = inu
                    }
                }) {
                    Image(systemName: "arrow.right")
                        .font(.system(size: 23))
                        .foregroundColor(hasCustomAccentColor ? customAccentColor : accentColor)
                }
                Spacer().overlay {
                    VStack {
                        if unitAmount == "Single" {
                            Text(outUnit)
                                .foregroundColor(hasCustomAccentColor ? customAccentColor : accentColor)
                                .padding(.vertical, 5)
                        } else {
                            Picker("Unit", selection: $outUnit) {
                                ForEach(units, id: \.self) { unit in
                                    Text(unit).tag(unit)
                                }
                            }
                            .pickerStyle(.menu)
                            .padding(.vertical, 5)
                            .accentColor(hasCustomAccentColor ? customAccentColor : accentColor)
                        }
                        Text(FormatNum(from: Measurement(value: firstAmount, unit: SwitchToUnits(text: inUnit)).converted(to: SwitchToUnits(text: outUnit)).value as NSNumber))
                            .font(.system(size: 25))
                            .textSelection(.enabled)
                    }
                }
            }
            .padding(.top, 30)
            .padding(.bottom, 53)
        }
        .onChange(of: saveUnits) { save in
            if save {
                newUnits.append(NewUnits(id: id, inUnit: inUnit, outUnit: outUnit))
                numOfUnits += 1
            }
        }
        .background(Color(.systemGray5))
        .cornerRadius(12)
    }
}
