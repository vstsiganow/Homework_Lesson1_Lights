//
//  ViewController.swift
//  Homework_Lesson1_Lights
//
//  Created by vtsyganov on 19.05.2021.
//

import UIKit

class ViewController: UIViewController {

    
    var topImageBrightness: CGFloat = 0.3
    var midImageBrightness: CGFloat = 0.3
    var botImageBrightness: CGFloat = 0.3
    
    var startButtonColor: UIColor = .blue
    var startButtonTitle: String = "START"
    var startButtonStatus: Int = 3
    
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var topUIImageView: UIImageView!
    @IBOutlet weak var midUIImageView: UIImageView!
    @IBOutlet weak var botUIImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeCircleBrightness()
        
    }

    

    @IBAction func changeLightState(_ sender: UIButton) {
        
        changeCircleBrightness()
        
    }
    
    
    func drawCircle(imageView: UIImageView, color: UIColor, brightness: CGFloat) {
        
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(
                x: imageView.frame.size.width/2,
                y: imageView.frame.size.height/2
            ),
            radius: CGFloat(imageView.frame.size.width/2),
            startAngle: CGFloat(0),
            endAngle: CGFloat(Double.pi * 2),
            clockwise: true
        )
            
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.path = circlePath.cgPath
            
        // Change the fill color
        shapeLayer.fillColor = color.cgColor
        
        imageView.layer.addSublayer(shapeLayer)
        
        imageView.alpha = brightness
    }
    
    func changeCircleBrightness() {
        
        if startButtonStatus >= 3 {
            startButtonStatus = 0
        } else {
            startButtonStatus += 1
        }
        
        switch startButtonStatus {
        case 1:
            startButtonColor = .red
            startButtonTitle = "NEXT"
            topImageBrightness = 1
            midImageBrightness = 0.3
            botImageBrightness = 0.3
        case 2:
            startButtonColor = .yellow
            startButtonTitle = "NEXT"
            topImageBrightness = 0.3
            midImageBrightness = 1
            botImageBrightness = 0.3
        case 3:
            startButtonColor = .green
            startButtonTitle = "NEXT"
            topImageBrightness = 0.3
            midImageBrightness = 0.3
            botImageBrightness = 1
        default:
            startButtonColor = .blue
            startButtonTitle = "START"
            topImageBrightness = 0.3
            midImageBrightness = 0.3
            botImageBrightness = 0.3
        }
        
        drawCircle(imageView: topUIImageView, color: .red, brightness: topImageBrightness)
        drawCircle(imageView: midUIImageView, color: .yellow, brightness: midImageBrightness)
        drawCircle(imageView: botUIImageView, color: .green, brightness: botImageBrightness)
        
        self.startButton.backgroundColor = startButtonColor
        
        self.startButton.setTitle(startButtonTitle, for: .normal)
        
        self.startButton.layer.cornerRadius = startButton.frame.size.height/2
        
    }
    

}

