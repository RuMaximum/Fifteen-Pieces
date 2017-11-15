//
//  TabBarItemGame.swift
//  Fifteen Pieces
//
//  Created by user on 15.11.17.
//  Copyright © 2017 Maxim Dvortsov. All rights reserved.
//

import UIKit

class TabBarItemGame: UIViewController {

    
    @IBOutlet weak var gameBoardView: UIView!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view7: UIView!
    @IBOutlet weak var view8: UIView!
    @IBOutlet weak var view9: UIView!
    @IBOutlet weak var view10: UIView!
    @IBOutlet weak var view11: UIView!
    @IBOutlet weak var view12: UIView!
    @IBOutlet weak var view13: UIView!
    @IBOutlet weak var view14: UIView!
    @IBOutlet weak var view15: UIView!
    @IBOutlet weak var view16: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        risuemMainPole(view: gameBoardView) //рисую поле
        self.view.backgroundColor = UIColor.white
        //вызов функции которая рисует пятнашки (точнее задает их начальную точку и размер, как и с полем)
        viewPaiceDraw(view: view1, i: 1)
        viewPaiceDraw(view: view2, i: 2)
        viewPaiceDraw(view: view3, i: 3)
        viewPaiceDraw(view: view4, i: 4)
        viewPaiceDraw(view: view5, i: 5)
        viewPaiceDraw(view: view6, i: 6)
        viewPaiceDraw(view: view7, i: 7)
        viewPaiceDraw(view: view8, i: 8)
        viewPaiceDraw(view: view9, i: 9)
        viewPaiceDraw(view: view10, i: 10)
        viewPaiceDraw(view: view11, i: 11)
        viewPaiceDraw(view: view12, i: 12)
        viewPaiceDraw(view: view13, i: 13)
        viewPaiceDraw(view: view14, i: 14)
        viewPaiceDraw(view: view15, i: 15)
        viewPaiceDraw(view: view16, i: 16)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // рисую сами квадратики
    func viewPaiceDraw(view: UIView, i: Int){
        let width = (Int((gameBoardView.frame.width * 0.94) / 4))
        let height = width
        
        view.frame = CGRect(x: pointFoView(i: i).x, y: pointFoView(i: i).y, width: width, height: height)
        
        // отображаемый номер фишки
        let numberFishki = CGRect(x: 0, y: 0, width: width, height: height)
        let numberLabel = UILabel(frame: numberFishki)
        
        view.layer.cornerRadius = 10 // скругляем углы фишек
        
        //на фишке 16 номер не показываем
        if i < 16 {
            numberLabel.text = "\(i)"
        }
        numberLabel.textAlignment = .center
        view.addSubview(numberLabel)
        
    }
    // рисую главный квадрат(поле)
    func risuemMainPole(view: UIView) {
        let width = self.view.frame.width
        let yPoint = self.view.center.y + (width + 20.0) / 2
        view.frame = CGRect(x: 20, y: Int(yPoint), width: Int(width - 40.0), height: Int(width - 40.0))
    }
    
    // возвращает начальные координаты для квадратиков
    func pointFoView(i: Int) -> (x: Int, y: Int) {
        var yPoint = 0
        var xPoint = 0
        let promejutokMejduPaice = (gameBoardView.frame.width) * 0.02
        let lengthPaice = (Int((gameBoardView.frame.width * 0.94) / 4))
        if i > 0 && i < 5 {
            xPoint = Int(promejutokMejduPaice) * i + lengthPaice * (i - 1)
            yPoint = Int(promejutokMejduPaice)
        } else if i > 4 && i < 9 {
            xPoint = Int(promejutokMejduPaice) * (i - 4) + lengthPaice * (i - 5)
            yPoint = Int(promejutokMejduPaice) * 2 + lengthPaice
        } else if i > 8 && i < 13 {
            xPoint = Int(promejutokMejduPaice) * (i - 8) + lengthPaice * (i - 9)
            yPoint = Int(promejutokMejduPaice) * 3 + lengthPaice * 2
        } else if i > 12 && i < 17 {
            xPoint = Int(promejutokMejduPaice) * (i - 12) + lengthPaice * (i - 13)
            yPoint = Int(promejutokMejduPaice) * 4 + lengthPaice * 3
        }
        return (xPoint, yPoint)
    }
    
    @IBAction func TapOnViewN(_ sender: UITapGestureRecognizer) {
        
        let pointView = (sender.view?.center)! // точка центер минивюшки на которую нажали
        let pointView16 = view16.center // центер пустой вюшки
        
        // это дистанция которую не должна превышать разница между координатами точек центра фишки на которую нажали и центра пустой фишки, чтоби произошла замена координат
        let distance = ((gameBoardView.frame.width * 0.94) / 4) + (gameBoardView.frame.width) * 0.02
        
        var x = pointView16.x - pointView.x
        if x < 0 {
            x *= -1
        }
        var y = pointView16.y - pointView.y
        if y < 0 {
            y *= -1
        }
        // если условие выполнено то меняю координаты местами
        if pointView16.x == pointView.x || pointView16.y == pointView.y{
            if x < distance && y < distance {
                // это сама анимация
                UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseOut, animations: {
                    self.view16.center = pointView
                    sender.view?.center = pointView16
                }, completion: { finished in
                    print("Ход сделан!")
                })
            }
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
