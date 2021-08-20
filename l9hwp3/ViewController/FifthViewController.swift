//
//  FifthViewController.swift
//  l9hwp3
//
//  Created by Cергей Иванович on 19.08.21.
//

import UIKit

class FifthViewController: UIViewController {
    var textInfo = ""
    
    private var initialCentr: CGPoint = .zero
    private let redView: UIView = {
        
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 100.0, height: 100.0)))
        
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false //отключение Autoresizing
        return view
    }()
    
    
    let lb = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: 100.0, height: 100.0)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(redView)
        lb.text = textInfo
        lb.textAlignment = .center
        redView.addSubview(lb)
        
        redView.center = view.center
        
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan(_:))) //создаем элемент UIPanGestureRecognizer который ссылается на метод выполнения
        
        redView.addGestureRecognizer(panGestureRecognizer) //добавляем на view PanGestureRecognizer
        
    }
    
    @objc private func didPan(_ sender: UIPanGestureRecognizer) {
        
        //        redView.center = sender.location(in: view) // просто перемещает на то место на которое мы потянули
        
        switch sender.state {                        //перебираем состояния sender
        case .began: initialCentr = redView.center   //запоминаем начальное расположение
        case .changed:
            
            let translation = sender.translation(in: view)    //на сколько изменились кординаты
            titlTheView(with: translation)
            
            //            redView.center = sender.location(in: view)     //это по простому а нижу через translation
            
            redView.center = CGPoint(x: initialCentr.x + translation.x, y: initialCentr.y + translation.y)
            
        case .ended, .cancelled: UIView.animate(withDuration: 3, delay: 3, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: [.curveEaseInOut]) { //withDuration - время в течении которого view возвращается на место delay - через сколько секунд начнется возвращение на место, usingSpringWithDamping - значения до 1 (это колебания элемента);initialSpringVelocity - начальная скорость анимации  значение 1 - общее расстояние анимации пройденное за 1 секунду
            self.redView.transform = .identity
            self.redView.center = self.view.center //возвращаем в центр
            
        }
        
        default:
            break
        }
    }
    
    func  titlTheView(with translationValue: CGPoint) {
        let translationMoved = self.view.center.x - self.redView.center.x
        let didKof = (self.view.frame.size.width/2)/40
        redView.transform = CGAffineTransform(rotationAngle: translationMoved / didKof)
        
    }
    
}
