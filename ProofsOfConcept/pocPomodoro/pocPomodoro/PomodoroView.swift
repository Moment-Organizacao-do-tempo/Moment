//
//  PomodoroView.swift
//  pocPomodoro
//
//  Created by Beatriz Carlos on 11/05/21.
//

import UIKit

class PomodoroView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var labelTime: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 34)
        return label
    }()
    
    lazy var buttonStartAndPause: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Iniciar", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        return button
    }()
    
    lazy var buttonCancel: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancelar", for: .normal)
        button.isEnabled = false
        button.alpha = 0.5
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private func setupUI() {
        self.addSubview(labelTime)
        self.addSubview(buttonStartAndPause)
        self.addSubview(buttonCancel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.labelTime.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            self.labelTime.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.buttonStartAndPause.topAnchor.constraint(equalTo: self.labelTime.bottomAnchor, constant: 30),
            self.buttonStartAndPause.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            self.buttonCancel.topAnchor.constraint(equalTo: self.labelTime.bottomAnchor, constant: 30),
            self.buttonCancel.leadingAnchor.constraint(equalTo: self.buttonStartAndPause.trailingAnchor, constant: 10),
        ])
    }
}
