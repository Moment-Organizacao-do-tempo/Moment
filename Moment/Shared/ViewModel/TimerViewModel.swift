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
    var timeInitial = 1500  // second
    lazy var time = 1500 // seconds

    @Published var timeString: String = "25:00"
    @Published var progressWaver: CGFloat = 1.0

    func startTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if time != 0 {
            time -= 1
            timeString = formatTime()
            progressWaver = changeProgressWaver()
        } else {
            // trocar botão para iniciar
            self.timer.invalidate()
        }
    }
    
    func stopTimer() -> Bool {
        timer.invalidate()
        return true
    }
    
    // method formats time to string.
    public func formatTime() -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    public func changeProgressWaver() -> CGFloat {
        return CGFloat(time) / CGFloat(timeInitial)
    }
}
