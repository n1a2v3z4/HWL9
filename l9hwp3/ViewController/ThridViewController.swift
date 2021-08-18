//
//  ThridViewController.swift
//  l9hwp3
//
//  Created by Cергей Иванович on 18.08.21.
//

import Foundation
import UIKit
class ThridViewController: UIViewController {
    var textInfo = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print (textInfo)
    }
    @IBAction func NextForForthView(_ sender: Any) {
        let nextVC = UIStoryboard(name: "ForthStoryboard", bundle: Bundle.main).instantiateViewController(identifier: "4") as! ForthViewController
        
        nextVC.textInfo = textInfo
       
//        navigationController?.show(nextVC, sender: nil)
        

        navigationController?.present(nextVC, animated: false, completion: {
            return
        })
        
    }
}
