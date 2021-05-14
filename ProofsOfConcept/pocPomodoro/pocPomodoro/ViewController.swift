//
//  ViewController.swift
//  pocPomodoro
//
//  Created by Beatriz Carlos on 11/05/21.
//

import UIKit

public enum TimerType: String {
    case pomodoro = "pomodoro"
    case shortBreak = "shortBreak"
    case longBreak = "longBreak"
}

class ViewController: UIViewController {
    private let defaults = UserDefaults.standard
    
    var timer = Timer()
    var isTimerStarted = false
    var time = getPomodoroTimer() // seconds
    
    let contentView: PomodoroView = {
        let view = PomodoroView(frame: UIScreen.main.bounds)
        view.buttonCancel.addTarget(self, action: #selector(clickButtonCancel), for: .touchUpInside)
        view.buttonStartAndPause.addTarget(self, action: #selector(clickButtonStartAndPause), for: .touchUpInside)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDefaults(with: defaults)
    }
    
    override func loadView() {
        super.loadView()
        self.view = contentView
    }
    
    func setupDefaults(with defaults: UserDefaults) {
        defaults.set(1500, forKey: TimerType.pomodoro.rawValue)
        // pause break
        // long break
    }
    
    public static func getPomodoroTimer() -> Int {
        return UserDefaults.standard.integer(forKey: TimerType.pomodoro.rawValue)
    }
    
    // get pause break
    // get long break
    
    // Action button cancel
    @objc func clickButtonCancel(sender: UIButton) {
        sender.isEnabled = false
        sender.alpha = 0.5
        
        self.timer.invalidate()
        self.time = ViewController.getPomodoroTimer()
        self.isTimerStarted = false
        
        self.contentView.labelTime.text = "25:00"
        self.contentView.buttonStartAndPause.setTitle("Iniciar", for: .normal)
        self.contentView.buttonStartAndPause.setTitleColor(.systemBlue, for: .normal)
    }
    
    // Action button play and pause
    @objc func clickButtonStartAndPause(sender: UIButton) {
        self.contentView.buttonCancel.isEnabled = true
        self.contentView.buttonCancel.alpha = 1
        
        if !isTimerStarted {
            startTimer()
            self.isTimerStarted = true
            
            sender.setTitle("Pausar", for: .normal)
            sender.setTitleColor(UIColor.systemBlue, for: .normal)
        } else {
            self.timer.invalidate()
            self.isTimerStarted = false
            
            sender.setTitle("Iniciar", for: .normal)
            sender.setTitleColor(.systemGreen, for: .normal)
        }
    }
    
    fileprivate func startTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        time -= 1
        self.contentView.labelTime.text = formatTime()
    }
    
    // method formats time to string.
    private func formatTime() -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
}
