//
//  ForthViewController.swift
//  l9hwp3
//
//  Created by Cергей Иванович on 18.08.21.
//

import Foundation
import UIKit
class ForthViewController: UIViewController {
    var textInfo = ""
   
    @IBOutlet weak var LableForForthView: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LableForForthView.text = textInfo
    }
    
    
}
