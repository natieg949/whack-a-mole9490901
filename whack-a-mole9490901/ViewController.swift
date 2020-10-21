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
    var mole = UIButton()
    var scoreLbl = UILabel()
    var score: Int = 0  {
        didSet  {
            scoreLbl.text = "\(score)"
        }
    }
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let screenBounds: CGRect = UIScreen.main.bounds
        screenWidth = Int(screenBounds.width)
        screenHeight = Int(screenBounds.height)
        
        //score
        score = 0
        scoreLbl.frame = CGRect(x: 20, y: 20, width: 100, height: screenHeight/10)
        scoreLbl.text = String(score)
        view.addSubview(scoreLbl)
        self.view = view
        
        //feild
        let feild = UILabel()
        feild.frame = CGRect(x: 20, y: 80, width: screenWidth - 40, height: screenHeight - 100)
        feild.backgroundColor = UIColor.green
        view.addSubview(feild)
        self.view = view
        
        //mole
        mole.frame = CGRect(x: 200, y: 400, width: 40, height: 40)
        mole.layer.cornerRadius = 20
        mole.backgroundColor = UIColor.brown
        mole.addTarget(self, action: #selector(hitMe(_:)), for: .touchUpInside)
        view.addSubview(mole)
        self.view = view
        
        //timer
        if (score != 10) {
            timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(missedButton(_:)), userInfo: nil, repeats: true)
        }
    }
    
    @objc func hitMe(_ sender:UIButton!) {
        mole.removeFromSuperview()
        if (score != 10) {
            score += 1
            timer.invalidate()
            let randomDiameter = Int.random(in: 10...50)
            let maxXRight = (screenWidth - 40) - randomDiameter
            let maxYBottom = (screenHeight - 100) - randomDiameter
            let randomX = Int.random(in: 20...maxXRight)
            let randomY = Int.random(in: 80...maxYBottom)
            
            mole.frame = CGRect(x: randomX, y: randomY, width: randomDiameter, height: randomDiameter)
            mole.layer.cornerRadius = CGFloat(randomDiameter/2)   // make radius 1/2 width
            view.addSubview(mole)
            
            timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(missedButton(_:)), userInfo: nil, repeats: true)
        }
    }
    
    @objc func missedButton(_ sender:UIButton!) {
        mole.removeFromSuperview()
        if (score != 10) {
            if (score != 0)  {
                score -= 1
            }
            let randomDiameter = Int.random(in: 10...50)
            let maxXRight = (screenWidth - 40) - randomDiameter
            let maxYBottom = (screenHeight - 100) - randomDiameter
            let randomX = Int.random(in: 20...maxXRight)
            let randomY = Int.random(in: 80...maxYBottom)
            
            mole.frame = CGRect(x: randomX, y: randomY, width: randomDiameter, height: randomDiameter)
            mole.layer.cornerRadius = CGFloat(randomDiameter/2)   // make radius 1/2 width
            view.addSubview(mole)
        }
    }
}
