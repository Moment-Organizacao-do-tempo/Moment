//
//  MomentAppIOS.swift
//  Moment
//
//  Created by Beatriz Carlos on 18/05/21.
//

import SwiftUI

@main
struct MomentApp: App {
    var currentPage: String = ""
    init() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().tintColor = UIColor(Color("ActionColor"))
        UINavigationBar.appearance().backgroundColor = .clear
        
        if !UserDefaults.standard.bool(forKey: "didLaunchBefore") {
            UserDefaults.standard.set(true, forKey: "didLaunchBefore")
            currentPage = "onboardingView"
        } else {
            currentPage = "homeView"
        }
    }
    
    var body: some Scene {
        WindowGroup {
            if self.currentPage == "onboardingView" {
                OnboardingView()
            } else if self.currentPage == "homeView" {
                ContentViewIOS()
            }
            
        }
    }
}
