//
//  ViewController.swift
//  Programmatic-Lab
//
//  Created by casandra grullon on 1/28/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import UIKit

class ColorGameViewController: UIViewController {

    private let colorGameView = ColorGameView()
    
    override func loadView() {
        view = colorGameView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }

    

}

