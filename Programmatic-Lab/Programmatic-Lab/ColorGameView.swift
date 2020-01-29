//
//  ColorGameView.swift
//  Programmatic-Lab
//
//  Created by casandra grullon on 1/28/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import UIKit

class ColorGameView: UIView {
    
    private var score = 0
    private var highestScore = 0
    
    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Score: \(score)"
        label.textAlignment = .center
        return label
    }()
    private lazy var gamePrompt: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    private lazy var highScore: UILabel = {
        let label = UILabel()
        label.text = "Highest Score: \(highestScore)"
        label.textAlignment = .center
        return label
    }()
    public lazy var colorInPlay: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = randomColor()
        return imageView
    }()
    private lazy var resetButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.text = "Reset"
        button.backgroundColor = .systemPink
        return button
    }()
    private lazy var colorButtonStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: rgbButtons())
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    public func randomColor() -> UIColor {
        let myRed = CGFloat.random(in: 0...1)
        let myBlue = CGFloat.random(in: 0...1)
        let myGreen = CGFloat.random(in: 0...1)
        let new = UIColor.init(red: myRed, green: myGreen, blue: myBlue, alpha: 1)
        return new
    }
    
    private func rgbButtons() -> [UIButton] {
        let redButton = UIButton()
        redButton.backgroundColor = .red
        redButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        let greenButton = UIButton()
        greenButton.tag = 1
        greenButton.backgroundColor = .green
        greenButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        let blueButton = UIButton()
        blueButton.tag = 2
        blueButton.backgroundColor = .blue
        blueButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        let arrayOfButtons = [redButton, greenButton, blueButton]
        
        return arrayOfButtons
    }
    
    @objc
    private func buttonPressed(_ sender: UIButton) {
        let myRed = CGFloat.random(in: 0...1)
        let myBlue = CGFloat.random(in: 0...1)
        let myGreen = CGFloat.random(in: 0...1)
        let random = [myRed, myGreen, myBlue]
        let dominantColor = random.max()
        
        switch dominantColor {
        case myRed:
            if sender.tag == 0 {
                score += 1
                colorInPlay.backgroundColor = randomColor()
                gamePrompt.text = "Correct!"
                gamePrompt.textColor = .green
            } else {
                gamePrompt.text = "Wrong!"
                gamePrompt.textColor = .red
                
            }
        case myGreen:
            if sender.tag == 1 {
                score += 1
                colorInPlay.backgroundColor = randomColor()
                gamePrompt.text = "Correct!"
                gamePrompt.textColor = .green
            } else {
                gamePrompt.text = "Wrong!"
                gamePrompt.textColor = .red
            }
        case myBlue:
            if sender.tag == 2 {
                score += 1
                colorInPlay.backgroundColor = randomColor()
                gamePrompt.text = "Correct!"
                gamePrompt.textColor = .green
            } else {
                gamePrompt.text = "Wrong!"
                gamePrompt.textColor = .red
            }
        default:
            break
        }
        
    }
    //MARK: Inits
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    private func commonInit() {
        setupColorInPlayConstraints()
        setupButtonStackConstraints()
        setupPromptConstraints()
        setupScoreConstraints()
        setupResetButtonConstraints()
    }
    
    //MARK: Constraints
    private func setupColorInPlayConstraints() {
        addSubview(colorInPlay)
        colorInPlay.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            colorInPlay.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            colorInPlay.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            colorInPlay.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            colorInPlay.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    private func setupButtonStackConstraints() {
        addSubview(colorButtonStack)
        colorButtonStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            colorButtonStack.topAnchor.constraint(equalTo: colorInPlay.bottomAnchor, constant: 20),
            colorButtonStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            colorButtonStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            colorButtonStack.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    private func setupPromptConstraints() {
        addSubview(gamePrompt)
        gamePrompt.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            gamePrompt.topAnchor.constraint(equalTo: colorButtonStack.bottomAnchor, constant: 20),
            gamePrompt.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            gamePrompt.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    private func setupScoreConstraints() {
        addSubview(scoreLabel)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: gamePrompt.bottomAnchor, constant: 20),
            scoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            scoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
            
        ])
    }
    private func setupResetButtonConstraints() {
        addSubview(resetButton)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resetButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            resetButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
}
