//
//  ViewController.swift
//  Homework05
//
//  Created by alihizardere on 19.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var labelResultNumbers: UILabel!
    var numberOnScreen:Int = 0
    var prevNumber:Int = 0
    var performingMath = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor(red: 0.18, green: 0.29, blue: 0.42, alpha: 1.00).cgColor,
                                UIColor(red: 0.10, green: 0.15, blue: 0.23, alpha: 1.00).cgColor]
        view.layer.addSublayer(gradientLayer)
        gradientLayer.zPosition = -1
       
    }

    @IBAction func numbers(_ sender: UIButton) {
        
        if performingMath == true {
            
            labelResult.text = String(sender.tag-1)
            numberOnScreen = Int(labelResult.text!)!
            performingMath = false
            
        }else{
            
            labelResult.text = labelResult.text! + String(sender.tag-1)
            numberOnScreen = Int(labelResult.text!)!
            
        }
        
    }
    
    @IBAction func operators(_ sender: UIButton) {
        
        if labelResult.text != "" && sender.tag != 13 && sender.tag != 11 {
            
            prevNumber = Int(labelResult.text!)!
            
            if sender.tag == 12{
                
                labelResult.text = "\(prevNumber)+"
                
            }
            
            performingMath = true
            
        }else if sender.tag == 13{
            
            labelResult.text = String(prevNumber + numberOnScreen)
            labelResultNumbers.text = "\(prevNumber) + \(numberOnScreen) ="
            
        }else if sender.tag == 11{
            
            labelResult.text = ""
            labelResultNumbers.text = ""
            prevNumber = 0
            numberOnScreen = 0
        }
    }
}

