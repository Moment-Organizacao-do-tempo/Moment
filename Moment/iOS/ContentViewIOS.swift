//
//  ContentViewIOS.swift
//  Moment
//
//  Created by Beatriz Carlos on 25/05/21.
//

import SwiftUI

struct ContentViewIOS: View {
    @State var displaySettings = false
    @StateObject var viewModel = TimerViewModel()

    var body: some View {
        
        NavigationView {
            VStack {
                NavigationLink(destination: SettingsView(), isActive: $displaySettings) {
                    EmptyView()
                }
                ContentView()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        print("chegou")
                    }) {
                        Image("reloadButton").renderingMode(.template).foregroundColor(Color("TextColor"))
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingsView()) {
                        Image("configButton")
                            .renderingMode(.template).foregroundColor(Color("TextColor"))
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentViewIOS_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewIOS()
    }
}
