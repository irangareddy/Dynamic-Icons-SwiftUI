//
//  IconNames.swift
//  Dynamic Icons SwiftUI
//
//  Created by RANGA REDDY NUKALA on 04/02/21.
//

import SwiftUI

class IconNames: ObservableObject {
    
    // 1
    var iconNames: [String?] = [nil]
    @Published var currentIndex = 0
    
    // 2
    init() {
        fetchAlternateIconNames()
        
        if let currentIcon = UIApplication.shared.alternateIconName {
            self.currentIndex = iconNames.firstIndex(of: currentIcon) ?? 0
        }
    }
    
    
    func fetchAlternateIconNames() {
        // 3
        if let icons = Bundle.main.object(forInfoDictionaryKey: "CFBundleIcons") as? [String: Any],
           let alternateIcons = icons["CFBundleAlternateIcons"] as? [String: Any] {
            for(_, value) in alternateIcons {
                
                // 4
                guard let iconList = value as? Dictionary<String,Any> else {
                    return
                }
                guard let iconFiles = iconList["CFBundleIconFiles"] as? [String] else {return}
                
                // 5
                guard let icon = iconFiles.first else {
                    return
                }
                
                iconNames.append(icon)
            }
        }
    }
}


