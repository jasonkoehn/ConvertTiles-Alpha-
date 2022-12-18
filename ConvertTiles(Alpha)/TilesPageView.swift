//
//  TilesPageView.swift
//  ConvertTiles(Alpha)
//
//  Created by Jason Koehn on 12/13/22.
//

import SwiftUI

struct TilesPageView: View {
    @State var showSettingsView = false
    @State var showAddTileView = false
    @FocusState var isInputActive: Bool
    @State var editMode: EditMode = .inactive
    @State var isEditing = false
    @State var converters: [Converter] = []
    var columns = [GridItem(.adaptive(minimum: 335))]
    @State private var accentColor: Color = loadColor(key: "accentColor")
    @State private var presentPurchaseSheet = false
    @AppStorage("pro") var pro: Bool = false
    @Environment(\.scenePhase) var scenePhase
    @State var saveUnits: Bool = false
    @State var newUnits: [NewUnits] = []
    @State var numOfUnits: Int = 0
    var body: some View {
        NavigationView {
            ZStack {
                if isEditing == true {
                    List {
                        ForEach(converters, id: \.id) { converter in
                            Text(converter.name)
                                .font(.system(size: 20))
                                .foregroundColor(converter.hasCustomAccentColor ? loadColorValues(inColor: converter.customAccentColor) : accentColor)
                        }
                        .onMove { indexSet, offset in
                            converters.move(fromOffsets: indexSet, toOffset: offset)
                        }
                        .onDelete { indexSet in
                            converters.remove(atOffsets: indexSet)
                        }
                    }
                    .environment(\.editMode, $editMode)
                    .background(Color.gray)
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(converters, id: \.id) { converter in
                                TileBoxView(name: converter.name, id: converter.id, units: converter.units, group: converter.group, unitAmount: converter.unitAmount, inUnit: converter.inUnit, outUnit: converter.outUnit, isInputActive: _isInputActive, accentColor: $accentColor, hasCustomAccentColor: converter.hasCustomAccentColor, customAccentColor: loadColorValues(inColor: converter.customAccentColor), saveUnits: $saveUnits, newUnits: $newUnits, numOfUnits: $numOfUnits)
                            }
                        }
                        .padding(.horizontal, 7)
                    }
                }
            }
            .navigationTitle("Converters")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isInputActive = false
                    }
                }
            }
            .navigationBarItems(leading: Button(action: {
                self.showSettingsView.toggle()
            }){
                Image(systemName: "gear")
            })
            .navigationBarItems(trailing: Button(action: {
                if pro {
                    self.showAddTileView.toggle()
                } else {
                    if converters.count > 2 {
                        self.presentPurchaseSheet = true
                    } else {
                        self.showAddTileView.toggle()
                    }
                }
            }){
                Image(systemName: "plus")
            })
            .navigationBarItems(trailing: Button(action: {
                isEditing.toggle()
                editMode = isEditing ? .active : .inactive
                if isEditing == false {
                    let manager = FileManager.default
                    guard let managerUrl = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
                    let encoder = PropertyListEncoder()
                    let convertersUrl = managerUrl.appendingPathComponent("converters.plist")
                    manager.createFile(atPath: convertersUrl.path, contents: nil, attributes: nil)
                    let encodedData = try! encoder.encode(converters)
                    try! encodedData.write(to: convertersUrl)
                }
            }){
                if isEditing == true {
                    Text("Done")
                        .font(.system(size: 18))
                } else {
                    Text("Edit")
                        .font(.system(size: 18))
                }
            })
        }
        
        // start of save units
        .onChange(of: scenePhase) { phase in
            if pro {
                if phase == .background {
                    saveUnits = true
                }
            }
        }
        .onChange(of: numOfUnits) { num in
            if num == converters.count {
                var newConverters: [Converter] = []
                for converter in converters {
                    for unit in newUnits {
                        if unit.id == converter.id {
                            newConverters.append(Converter(name: converter.name, id: converter.id, group: converter.group, unitAmount: converter.unitAmount, units: converter.units, inUnit: unit.inUnit, outUnit: unit.outUnit, hasCustomAccentColor: converter.hasCustomAccentColor, customAccentColor: converter.customAccentColor))
                        }
                    }
                }
                let manager = FileManager.default
                guard let managerUrl = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
                let encoder = PropertyListEncoder()
                let convertersUrl = managerUrl.appendingPathComponent("converters.plist")
                manager.createFile(atPath: convertersUrl.path, contents: nil, attributes: nil)
                let encodedData = try! encoder.encode(newConverters)
                try! encodedData.write(to: convertersUrl)
            }
        }
        // end of save units
        
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: $showSettingsView) {
            NavigationView {
                SettingsView(accentColor: $accentColor)
            }
        }
        .sheet(isPresented: $showAddTileView) {
            NavigationView {
                AddTileView(converters: $converters, accentColor: accentColor)
            }
        }
        .fullScreenCover(isPresented: $presentPurchaseSheet) {
            NavigationView {
                PurchaseView()
            }
        }
        .task {
            //Retrieve Converters
            let manager = FileManager.default
            let decoder = PropertyListDecoder()
            guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
            let convertersUrl = url.appendingPathComponent("converters.plist")
            if let data = try? Data(contentsOf: convertersUrl) {
                if let response = try? decoder.decode([Converter].self, from: data) {
                    converters = response
                }
            }
        }
    }
}

struct TilesPageView_Previews: PreviewProvider {
    static var previews: some View {
        TilesPageView()
    }
}
