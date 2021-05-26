//
//  WaterWave.swift
//  Moment
//
//  Created by Beatriz Carlos on 25/05/21.
//

import SwiftUI

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
        
        for xPoint in stride(from: CGFloat(0), to: (CGFloat(width) + CGFloat(5)), by: CGFloat(5)) {
            
            let relativeX = xPoint/waveLength
            let normalizedLength = (xPoint-minWidth)/minWidth
            let yPoint = progressHeight + sin(phase + relativeX)*applitude*normalizedLength
            
            path.addLine(to: CGPoint(x: xPoint, y: yPoint))
        }
        
        path.addLine(to: CGPoint(x: width, y: progressHeight))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: progressHeight))
        
        return path
    }
}
