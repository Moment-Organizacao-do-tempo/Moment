//
//  ViewController.swift
//  Moment
//
//  Created by Beatriz Carlos on 18/05/21.
//

import Foundation

class TimerController {
    private let timerModel = TimerModel()
    var timer = Timer()
    var isTimerStarted = true
    var time = 5

    // Action button play and pause
    func startAndPauseTimer() {
        if !isTimerStarted {
            self.isTimerStarted = true
            startTimer()
            print(formatTime())
        } else {
            self.timer.invalidate()
            self.isTimerStarted = false
        }
    }
    
    func startTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if time != 0 {
            time -= 1
            print(formatTime())
        } else {
            // trocar botão para iniciar
            self.timer.invalidate()
        }
    }
    
    // method formats time to string.
    public func formatTime() -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
}
