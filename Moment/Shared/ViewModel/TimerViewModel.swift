//
//  TimerViewModel.swift
//  Moment
//
//  Created by Beatriz Carlos on 24/05/21.
//

import SwiftUI
import AVFoundation

class TimerViewModel: ObservableObject {
    
    @Published var timerMode: TimerMode = .initial

    var timer = Timer()
    var isTimerStarted = false
    
    @AppStorage(Settings.pomodoro) var totalTime: Int = 1500
    @AppStorage(Settings.breakPause) var breakPause: Int = 0
    @AppStorage(Settings.longPause) var longPause: Int = 0
    @AppStorage(Settings.cycles) var cycles: Int = 0

    @Published var timeString: String = "00:00"
    @Published var pomodoroName: String = "Pomodoro"
    @Published var progressWaver: CGFloat = 1.0
    
    var runningTime: Int
    
    init() {
        self.runningTime = UserDefaults.standard.integer(forKey: Settings.pomodoro)
        self.timeString = formatTime(time: runningTime)
        self.timerMode = .initial
    }
    
    func updateRunningTime() {
        self.runningTime = UserDefaults.standard.integer(forKey: Settings.pomodoro)
        self.timeString = formatTime(time: runningTime)
    }
    
    func start() {
        timerMode = .running
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    var flagBreak = 0
    @objc func updateTimer() {
        if runningTime == 0 {
            restartTimer()
        }
        
        runningTime -= 1
        timeString = formatTime(time: runningTime)
        progressWaver = changeProgressWaver(timeType: totalTime)
    }
    
    func restartTimer() {
        timer.invalidate()
        timerMode = .initial
        runningTime = self.totalTime
        timeString = formatTime(time: runningTime)
    }
    
    func pause() {
        self.timerMode = .paused
        timer.invalidate()
    }
    
    // method formats time to string.
    public func formatTime(time: Int) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    public func changeProgressWaver(timeType: Int) -> CGFloat {
        return CGFloat(runningTime) / CGFloat(timeType)
    }
}
