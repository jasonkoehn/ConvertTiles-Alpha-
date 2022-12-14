//
//  TilesPageView.swift
//  ConvertTiles(Alpha)
//
//  Created by Jason Koehn on 12/13/22.
//

import SwiftUI

struct TilesPageView: View {
    @AppStorage("Pro") var isPro = false
    @State var showSettingsView = false
    @State var showAddTileView = false
    @FocusState var isInputActive: Bool
    @State var editMode: EditMode = .inactive
    @State var isEditing = false
    @State var converters: [Converter] = []
    var columns = [GridItem(.adaptive(minimum: 335))]
    var body: some View {
        NavigationView {
            ZStack {
                if isEditing == true {
                    List {
                        ForEach(converters, id: \.id) { converter in
                            Text(converter.name)
                                .font(.system(size: 20))
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
                                TileBoxView(name: converter.name, units: converter.units, group: converter.group, unitAmount: converter.unitAmount, inUnit: converter.inUnit, outUnit: converter.outUnit, isInputActive: _isInputActive)
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
                self.showAddTileView.toggle()
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
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: $showSettingsView) {
            NavigationView {
                SettingsView()
            }
        }
        .sheet(isPresented: $showAddTileView) {
            NavigationView {
                AddTileView(converters: $converters)
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
