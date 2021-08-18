//
//  SecondViewController.swift
//  l9hwp3
//
//  Created by Cергей Иванович on 18.08.21.
//

import Foundation
import UIKit
class SecondViewController: UIViewController {
    var textInfo = ""
    
    
    override func viewDidLoad () {
        super.viewDidLoad()
        print (textInfo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "3" {
            let toVC = segue.destination as! ThridViewController
            
            toVC.textInfo = textInfo
            toVC.modalTransitionStyle = .flipHorizontal
        }
    }
    
}
