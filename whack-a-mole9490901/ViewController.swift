//
//  ViewController.swift
//  whack-a-mole9490901
//
//  Created by Goldberg, Natalie E on 10/8/20.
//  Copyright © 2020 Goldberg, Natalie E. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var screenWidth = 0
    var screenHeight = 0
    var horizLbl = UILabel()
    var vertLbl = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let screenBounds: CGRect = UIScreen.main.bounds
        screenWidth = Int(screenBounds.width)
        screenHeight = Int(screenBounds.height)
        
        horizLbl.frame = CGRect(x: 20, y: 100, width: screenWidth - 40, height: 50)
        horizLbl.backgroundColor = UIColor.blue
        horizLbl.text = "Screen width: \(screenWidth), Label width: \(screenWidth - 40)"
        
        view.addSubview(horizLbl)
        
        vertLbl.frame = CGRect(x: 50, y: 20, width: 5, height: screenHeight - 40)
        vertLbl.backgroundColor = UIColor.red
        vertLbl.text = "Screen height: \(screenHeight), Label height: \(screenHeight - 40)"
        vertLbl.transform = CGAffineTransform(rotationAngle: .pi/2.0)
        
        view.addSubview(vertLbl)
        self.view = view
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLog("bounds = \(self.view.bounds)")
        
        let screenBounds: CGRect = UIScreen.main.bounds
        screenWidth = Int(screenBounds.width)
        screenHeight = Int(screenBounds.height)
        
        horizLbl.frame = CGRect(x: 20, y: 100, width: screenWidth - 40, height: 50)
        horizLbl.text = "Screen width: \(screenWidth), Lable width: \(screenWidth - 40)"
        vertLbl.frame = CGRect(x: 50, y: 20, width: 50, height: screenHeight - 40)
        vertLbl.text = "Screen height: \(screenHeight), Label height: \(screenHeight - 40)"
    }
}

