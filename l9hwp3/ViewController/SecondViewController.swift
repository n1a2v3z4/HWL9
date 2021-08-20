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
  
    
    
    //Почему срабатывает один раз (т.е. если со следующего экрана вернуться назад и опять попробовать перейти вперед по нажатию на View с задержкой 2 с. это не срабатывает? )
    
    @IBAction func longPressed(sender: UILongPressGestureRecognizer)
    {
       
        if sender.state == .began {
        let nextVC = UIStoryboard(name: "ThridStoryboard", bundle: Bundle.main).instantiateViewController(identifier: "3") as! ThridViewController
        
        
        nextVC.textInfo = textInfo
        
            show(nextVC, sender: self) //так тоже не работает при возвращении
            
//        navigationController?.pushViewController(nextVC, animated: true) // и так тоже
        print ("1")
        }
    }
}
