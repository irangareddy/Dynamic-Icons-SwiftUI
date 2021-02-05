//
//  Dynamic_Icons_SwiftUIApp.swift
//  Dynamic Icons SwiftUI
//
//  Created by RANGA REDDY NUKALA on 04/02/21.
//

import SwiftUI

@main
struct Dynamic_Icons_SwiftUIApp: App {
    @StateObject var iconNames = IconNames()
      
      var body: some Scene {
          WindowGroup {
              ContentView()
                  .environmentObject(iconNames)
          }
      }
}
