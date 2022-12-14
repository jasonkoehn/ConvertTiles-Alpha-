//
//  AddTileView.swift
//  ConvertTiles(Alpha)
//
//  Created by Jason Koehn on 12/13/22.
//

import SwiftUI

struct AddTileView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var group = "Acceleration"
    @State var name = ""
    @State var units: [String] = []
    @State var inUnit = ""
    @State var outUnit = ""
    @State var customSelection: Bool = false
    @State var customUnits: [String] = []
    @State var unitAmount = "Multiple"
    @Binding var converters: [Converter]
    @State var accentColor: Color
    var body: some View {
        Form {
            // Selection of the Group
            Picker("Group:", selection: $group) {
                ForEach(convertersList, id: \.group) { converter in
                    Text(converter.group).tag(converter.group)
                        .task {
                            units = converter.units
                            name = converter.group
                            inUnit = units.first ?? ""
                            outUnit = units.first ?? ""
                        }
                        .onChange(of: group) { group in
                            customUnits = []
                            if customSelection {
                                inUnit = ""
                                outUnit = ""
                            }
                        }
                }
            }
            .pickerStyle(.navigationLink)
            
            // Name Slot
            HStack {
                Text("Name:")
                TextField(group, text: $name)
                ZStack {
                    Button(action: {
                        name = ""
                    }) {
                        Image(systemName: "multiply")
                            .font(.system(size: 24))
                            .foregroundColor(.blue)
                    }
                }
            }
            
            // Selection Number Picker
            Picker("", selection: $unitAmount) {
                Text("Multiple Units").tag("Multiple")
                Text("Single Selections").tag("Single")
            }
            .pickerStyle(.segmented)
            
            // Various Conditional pickers
            if unitAmount == "Multiple" {
                Toggle("Custom Units?", isOn: $customSelection)
                if customSelection {
                    NavigationLink("Select Units:") {
                        List {
                            ForEach(units, id: \.self) { unit in
                                Button(action: {
                                    if customUnits.contains(unit) {
                                        customUnits.removeAll(where: {$0 == unit})
                                    }
                                    else {
                                        customUnits.append(unit)
                                    }
                                }) {
                                    HStack {
                                        Text(unit)
                                            .foregroundColor(accentColor)
                                        if customUnits.contains(unit) {
                                            Spacer()
                                            Image(systemName: "checkmark")
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .task {
                        if inUnit == "" {
                            inUnit = customUnits.first ?? ""
                            outUnit = customUnits.first ?? ""
                        }
                    }
                    if customUnits != [] {
                        Picker("Initial In Unit:", selection: $inUnit) {
                            ForEach(customUnits, id: \.self) { unit in
                                Text(unit).tag(unit)
                            }
                        }
                        .pickerStyle(.menu)
                        Picker("Initial Out Unit:", selection: $outUnit) {
                            ForEach(customUnits, id: \.self) { unit in
                                Text(unit).tag(unit)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                } else {
                    Picker("Initial In Unit:", selection: $inUnit) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit).tag(unit)
                        }
                    }
                    .pickerStyle(.menu)
                    Picker("Initial Out Unit:", selection: $outUnit) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit).tag(unit)
                        }
                    }
                    .pickerStyle(.menu)
                }
            } else if unitAmount == "Single" {
                Picker("In Unit:", selection: $inUnit) {
                    ForEach(units, id: \.self) { unit in
                        Text(unit).tag(unit)
                    }
                }
                .pickerStyle(.menu)
                Picker("Out Unit:", selection: $outUnit) {
                    ForEach(units, id: \.self) { unit in
                        Text(unit).tag(unit)
                    }
                }
                .pickerStyle(.menu)
            }
        }
        .accentColor(accentColor)
        .navigationTitle("Add A Tile")
        .navigationBarItems(trailing: Button(action: {
            if unitAmount == "Multiple" {
                if customSelection {
                    converters.append(Converter(name: name, id: UUID(), group: group, unitAmount: unitAmount, units: customUnits, inUnit: inUnit, outUnit: outUnit))
                } else {
                    converters.append(Converter(name: name, id: UUID(), group: group, unitAmount: unitAmount, units: units, inUnit: inUnit, outUnit: outUnit))
                }
            } else if unitAmount == "Single" {
                converters.append(Converter(name: name, id: UUID(), group: group, unitAmount: unitAmount, units: units, inUnit: inUnit, outUnit: outUnit))
            }
            let manager = FileManager.default
            guard let managerUrl = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
            let encoder = PropertyListEncoder()
            let convertersUrl = managerUrl.appendingPathComponent("converters.plist")
            manager.createFile(atPath: convertersUrl.path, contents: nil, attributes: nil)
            let encodedData = try! encoder.encode(converters)
            try! encodedData.write(to: convertersUrl)
            presentationMode.wrappedValue.dismiss()
        }){
            Text("Save")
        })
    }
}
