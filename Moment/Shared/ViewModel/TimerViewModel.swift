//
//  TimerViewModel.swift
//  Moment
//
//  Created by Beatriz Carlos on 24/05/21.
//

import SwiftUI
import AVFoundation

class TimerViewModel: ObservableObject {
    
    var timer = Timer()
    var isTimerStarted = false
    lazy var time = self.getPomodoroTimer() // seconds
    
    @Published var timeString: String = "00:00"
    @Published var pomodoroName: String = "Nome do pomodoro"
    @Published var progressWaver: CGFloat = 1.0
    
    init() {
        UserDefaults.standard.set(10, forKey: "pomodoro")
        UserDefaults.standard.set(5, forKey: "breakPause")
        UserDefaults.standard.set(600, forKey: "longPause")
        self.timeString = formatTime(time: time)
    }
    
    // get pomodoro timer
    public func getPomodoroTimer() -> Int {
        return UserDefaults.standard.integer(forKey: "pomodoro")
    }
    
    // get pause break
    public func getShortBreakTimer() -> Int {
        return UserDefaults.standard.integer(forKey: "breakPause")
    }
    
    // get long break
    public func getLongBreakTimer() -> Int {
        return UserDefaults.standard.integer(forKey: "longPause")
    }
    
    func startTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    var flagBreak = 0
    @objc func updateTimer() {
        if time != 0 {
            time -= 1
            timeString = formatTime(time: time)
            progressWaver = changeProgressWaver(timeType: getPomodoroTimer())
        } else {
            flagBreak += 1
            if flagBreak == 1 {
                changeBreakPause()
                flagBreak += 1
            } else {
                _ = stopTimer()
            }
        }
    }
    
    func changeBreakPause() {
        time = getShortBreakTimer()
        pomodoroName = "Hora da pausa!"
        progressWaver = changeProgressWaver(timeType: getShortBreakTimer())
        self.timeString = formatTime(time: time)
    }
    
    func stopTimer() -> Bool {
        pomodoroName = "Parabéns, acabou!"
        timer.invalidate()
        return true
    }
    
    // method formats time to string.
    public func formatTime(time: Int) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    public func changeProgressWaver(timeType: Int) -> CGFloat {
        return CGFloat(time) / CGFloat(timeType)
    }
}
