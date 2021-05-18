//
//  ContentView.swift
//  Shared
//
//  Created by Beatriz Carlos on 14/05/21.
//

import SwiftUI
//swiftlint:disable identifier_name
struct ContentView: View {
    @State var progress: CGFloat = 0.6
    @State var phase: CGFloat = 0.0
    var body: some View {
        GeometryReader { geometry in
            WaterWave(progress: self.progress, phase: self.phase)
                .fill(Color.init("FillWaterWave"))
                .clipShape(Capsule())
                .frame(width: 228, height: 228)
                .gesture(DragGesture(minimumDistance: 0)
                .onChanged({ (value) in
                    self.progress = 1-(value.location.y/geometry.size.height)
                }))
        }.onAppear {
            withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                self.phase = .pi * 2
            }
        }
        
    }
}

struct WaterWave: Shape {
    
    let progress: CGFloat
    let applitude: CGFloat = 10
    var waveLength: CGFloat = 20
    var phase: CGFloat
    
    var animatableData: CGFloat {
        get { phase }
        set { phase = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        
        let minWidth = width/2
        let progressHeight = height * (1 - progress)
        
        path.move(to: CGPoint(x: 0, y: progressHeight))
        
        for x in stride(from: 0, to: width + 5, by: 5) {
            
            let relativeX = x/waveLength
            let normalizedLength = (x-minWidth)/minWidth
            let y = progressHeight + sin(phase + relativeX)*applitude*normalizedLength
            
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        path.addLine(to: CGPoint(x: width, y: progressHeight))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: progressHeight))
        
        return path
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
