//
//  ContentView.swift
//  Dynamic Icons SwiftUI
//
//  Created by RANGA REDDY NUKALA on 04/02/21.
//

import SwiftUI

struct ContentView: View {
    
    // 1
    
    @EnvironmentObject var iconSettings : IconNames
    private var twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    
    var body: some View {
        
        NavigationView {
            // 2
            ScrollView {
                LazyVGrid(columns: twoColumnGrid,spacing: 8) {
                    ForEach(0..<iconSettings.iconNames.count) { index in
                        
                        // 3
                        VStack {
                            Image(uiImage: UIImage(named: iconSettings.iconNames[index] ?? "AppIcon60x60") ?? UIImage())
                                .renderingMode(.original) //important
                                .resizable()
                                .frame(width: 120,height: 120)
                                .scaledToFit()
                                // 5
                                .onTapGesture {
                                    
                                    let value = index
                                    let mindex = self.iconSettings.iconNames.firstIndex(of: UIApplication.shared.alternateIconName) ?? 0
                                    
                                    // 6
                                    if mindex != value{
                                        
                                        UIApplication.shared.setAlternateIconName(self.iconSettings.iconNames[index]){ error in
                                            if let error = error {
                                                print(error.localizedDescription)
                                            } else {
                                                print("Successfully AppIcon is Changed")
                                            }
                                        }
                                    }
                                }
                            Text("\(iconSettings.iconNames[index]?.capitalized ?? "Default")")
                        }.padding()
                    }
                }.padding()
            }.navigationBarTitle("Dynamic Icons")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
