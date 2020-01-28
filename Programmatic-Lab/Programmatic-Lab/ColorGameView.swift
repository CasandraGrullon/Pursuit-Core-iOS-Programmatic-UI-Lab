//
//  ColorGameView.swift
//  Programmatic-Lab
//
//  Created by casandra grullon on 1/28/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import UIKit

class ColorGameView: UIView {

    public lazy var colorInPlay: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = randomColor()
        return imageView
    }()
    
    private lazy var colorButtonStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: rgbButtons())
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 50
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private func randomColor() -> UIColor {
        let myRed = CGFloat.random(in: 0...1)
        let myBlue = CGFloat.random(in: 0...1)
        let myGreen = CGFloat.random(in: 0...1)
        let new = UIColor.init(red: myRed, green: myGreen, blue: myBlue, alpha: 1)
        return new
    }
    private func rgbButtons() -> [UIButton] {
        let red = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1)
        let green = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1)
        let blue = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1)
        let redButton = UIButton()
        redButton.backgroundColor = red
        let greenButton = UIButton()
        greenButton.backgroundColor = green
        let blueButton = UIButton()
        blueButton.backgroundColor = blue
        
        var arrayOfButtons = [UIButton]()
        arrayOfButtons.append(redButton)
        arrayOfButtons.append(greenButton)
        arrayOfButtons.append(blueButton)
        
        return arrayOfButtons
    }
    
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
    }
    
    private func setupColorInPlayConstraints() {
        addSubview(colorInPlay)
        colorInPlay.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            colorInPlay.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            colorInPlay.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            colorInPlay.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            colorInPlay.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    private func setupButtonStackConstraints() {
        addSubview(colorButtonStack)
        colorButtonStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            colorButtonStack.topAnchor.constraint(equalTo: colorInPlay.bottomAnchor, constant: 20),
            colorButtonStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            colorButtonStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            colorButtonStack.heightAnchor.constraint(equalToConstant: 60),
            colorButtonStack.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
}
