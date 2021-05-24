//
//  TimerViewModel.swift
//  Moment
//
//  Created by Beatriz Carlos on 24/05/21.
//

import SwiftUI

class TimerViewModel: ObservableObject {
    
    var timer = Timer()
    var isTimerStarted = false
    lazy var time = 1500 // seconds
    
    @Published var timeString: String = "25:00"
    
     func startTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if time != 0 {
            time -= 1
            timeString = formatTime()
        } else {
            // trocar botão para iniciar
            self.timer.invalidate()
        }
    }
    
    // method formats time to string.
    private func formatTime() -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
}
