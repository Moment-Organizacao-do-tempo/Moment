//
//  MomentAppIOS.swift
//  Moment
//
//  Created by Beatriz Carlos on 18/05/21.
//

import SwiftUI

@main
struct MomentApp: App {
    init() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().tintColor = UIColor(Color("ActionColor"))
        UINavigationBar.appearance().backgroundColor = .clear
    }
    
    var body: some Scene {
        WindowGroup {
            ContentViewIOS()
        }
    }
}
