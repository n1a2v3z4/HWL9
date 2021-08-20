//
//  ViewController.swift
//  l9hwp3
//
//  Created by Cергей Иванович on 18.08.21.
//

//    . Создать 4 UIViewController на сториборде. Для каждого создать отдельный класс (по типу FirstViewController и т.п).  Дополнительно создать navigation controller(его можно как создать кодом, так и в сториборде - по желанию)
//    2. В каждом классе создать переменную textInfo с типом String и пустым начальным значением (= "").
//    3. В первом контроллере добавьте UITextField. Логика будет такая, вы пишете в текстфилде какой-то текст, потом когда нажимаете на кнопку, достаете из него текст и помещаете в переменную textInfo. Также в первом контроллере надо кодом из сториборда (используя UIStoryboard().instantiateViewController) достать второй экран и кодом передать значение textInfo во второй контроллер. Показать его с помощью pushViewController.
//    4. Переход и от второго к третьему сделайте с использованием segue в сториборде, а передачу данных с помощью функции prepareForSegue.
//    5. Переход от третьего к четвертому тоже сделать используя UIStoryboard().instantiateViewController, но показать с помощью present, но через navigation controller.
//    6. В четвертом экране, когда экран полностью покажется, текст из textInfo должен показаться в лейбле.
import UIKit

class FirstViewController: UIViewController {
    var textInfo:String? = ""
    let textField: UITextField = {
        let field = UITextField(frame: CGRect(origin: .zero, size: CGSize(width: 200, height: 200)))
        field.backgroundColor = .red
        return field
        
    }()
    
    let buttonNext: UIButton = {
        
        let button = UIButton(frame: CGRect(origin: .zero, size: CGSize(width: 50, height: 50)))
        button.backgroundColor = .orange
        button.setTitle("Next", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target:self, action:#selector(swipeHandler(recognizer: )))
            swipeGestureRecognizer.direction = [.left]
            view.addGestureRecognizer(swipeGestureRecognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        view.backgroundColor = .blue
        textField.center = view.center
        view.addSubview(textField)
        buttonNext.center = CGPoint(x: view.frame.maxX/2, y: view.frame.maxY - 100)
        view.addSubview(buttonNext)
        buttonNext.addTarget(self, action: #selector(action(sender:)), for: UIControl.Event.touchUpInside)
    }
    
    @objc func action (sender: UIButton!) {
        let nextVC = UIStoryboard(name: "SecondStoryboard", bundle: Bundle.main).instantiateViewController(identifier: "2") as! SecondViewController
        
        
        nextVC.textInfo = textField.text!
        
        navigationController?.pushViewController(nextVC, animated: false)
    }
    
    @objc func swipeHandler (recognizer: UISwipeGestureRecognizer) {
       
        if recognizer.state == .ended {   //состояние распознавания жестов закончено
            let nextVC = UIStoryboard(name: "SecondStoryboard", bundle: Bundle.main).instantiateViewController(identifier: "2") as! SecondViewController
            
            
            nextVC.textInfo = textField.text!
            
            navigationController?.pushViewController(nextVC, animated: true)
        }
           
        }
    
}
