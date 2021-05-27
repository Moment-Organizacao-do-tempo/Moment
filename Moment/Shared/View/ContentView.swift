//
//  ContentView.swift
//  Shared
//
//  Created by Beatriz Carlos on 14/05/21.
//

import SwiftUI

struct ContentView: View {
    @State var phase: CGFloat = 0.0
    @State var isPlaying: Bool = false
    
    @ObservedObject var viewModel: TimerViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            #if os(macOS)
                Button(action: {
                    viewModel.restartTimer()
                }) {
                    Image("reloadButton").renderingMode(.template).foregroundColor(Color("TextColor"))
                }.buttonStyle(PlainButtonStyle()).frame(alignment: .leading)
            #endif
            
            textTimer
            circle
            
            Spacer()
            
            Image(viewModel.timerMode == .running ? "pauseButton" : "playButton")
                .renderingMode(.template)
                .foregroundColor(Color("ActionColor"))
                .onTapGesture(perform: {
                    self.viewModel.timerMode == .running ? self.viewModel.pause() : self.viewModel.start()
                })
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("BackgroundColor").ignoresSafeArea())
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                    self.phase = .pi * 2
                }
            }
        }
        .onChange(of: viewModel.totalTime) { _ in
            viewModel.updateRunningTime()
        }
    }
    
    private var textTimer: some View {
        VStack(spacing: 30) {
            Text(viewModel.pomodoroName)
                .foregroundColor(Color("TextColor"))
                .multilineTextAlignment(.center)
                .font(.custom("Montserrat-Regular", size: 24))
            
            Text(viewModel.timeString)
                .foregroundColor(Color("TextColor"))
                .multilineTextAlignment(.center)
                .font(.custom("Montserrat-Regular", size: 36))
        }
    }
    
    public var circle: some View {
        ZStack {
            Circle()
                .fill(
                    RadialGradient(gradient: Gradient(colors: [Color.init("ColorGradientInitial"), Color.init("ColorGradientFinal")]), center: .center, startRadius: 0, endRadius: 250)
                ).frame(width: 238, height: 238)
            
            WaterWave(progress: viewModel.progressWaver, phase: self.phase)
                .fill(Color.init("FillWaterWave"))
                .clipShape(Capsule())
                .frame(width: 228, height: 228)
            
            Circle()
                .fill(
                    RadialGradient(gradient: Gradient(
                                    colors: [.clear, Color.init("GlassGradientFinal")]),
                                   center: .center, startRadius: 0,
                                   endRadius: 200)
                ).frame(width: 238, height: 238).opacity(0.3)
            
            Image("Texture").opacity(0.45)
        }
        .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView() .preferredColorScheme(.dark)
//    }
//}
