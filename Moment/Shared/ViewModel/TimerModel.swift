//
//  ViewModel.swift
//  Moment
//
//  Created by Beatriz Carlos on 18/05/21.
//

import Foundation

//swiftlint:disable todo
class TimerModel {
    private let defaults = UserDefaults.standard
    
    // TODO: inicializada com o que receber da Controller
    lazy var time = self.getPomodoroTimer() // seconds
    
    func setupDefaults(with defaults: UserDefaults) {
        // pomodoro - 15 minutes
        defaults.set(900, forKey: TimerType.pomodoro.rawValue)
        
        // pause break - 5 minutes
        defaults.set(300, forKey: TimerType.shortBreak.rawValue)

        // long break - 10 minutes
        defaults.set(600, forKey: TimerType.longBreak.rawValue)
    }
    
    // get pomodoro timer
    public func getPomodoroTimer() -> Int {
        return UserDefaults.standard.integer(forKey: TimerType.pomodoro.rawValue)
    }
    
    // get pause break
    public func getShortBreakTimer() -> Int {
        return UserDefaults.standard.integer(forKey: TimerType.shortBreak.rawValue)
    }
    
    // get long break
    public func getLongBreakTimer() -> Int {
        return UserDefaults.standard.integer(forKey: TimerType.longBreak.rawValue)
    }
}
