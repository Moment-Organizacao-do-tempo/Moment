//
//  ContentView.swift
//  Shared
//
//  Created by Beatriz Carlos on 14/05/21.
//

import SwiftUI

struct ContentView: View {
    @State var progress: CGFloat = 0.5
    @State var phase: CGFloat = 0.0
    
    @StateObject var viewModel = TimerViewModel()
    
    var body: some View {
        VStack {
            textTimer
            circle
            Button("Play") {
                print("Testes")
            }
        }
        .padding(.top, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("BackgroundColor").ignoresSafeArea())
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                    self.phase = .pi * 2
                }
            }
        }
    }
    
    private var textTimer: some View {
        VStack(spacing: 30) {
            Text("Nome do pomodoro")
                .foregroundColor(Color("TextColor"))
                .multilineTextAlignment(.center)
                .font(.custom("Montserrat-Regular", size: 28))
            
            Text(viewModel.timeString)
                .foregroundColor(Color("TextColor"))
                .multilineTextAlignment(.center)
                .font(.custom("Montserrat-Regular", size: 68))
        }
    }
    
    public var circle: some View {
        ZStack {
            Circle()
                .fill(
                    RadialGradient(gradient: Gradient(colors: [Color.init("ColorGradientInitial"), Color.init("ColorGradientFinal")]), center: .center, startRadius: 0, endRadius: 250)
                ).frame(width: 238, height: 238)
            
            WaterWave(progress: self.progress, phase: self.phase)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        
    }
}
