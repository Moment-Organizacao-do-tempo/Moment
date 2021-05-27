//
//  MomentAppMacOS.swift
//  Moment
//
//  Created by Beatriz Carlos on 18/05/21.
//

import SwiftUI

@main
struct MomentApp: App {
    @StateObject var viewModel = TimerViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel).frame(width: 440, height: 600, alignment: .center)
        }
    }
}
