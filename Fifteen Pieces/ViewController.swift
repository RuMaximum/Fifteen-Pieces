//
//  ViewController.swift
//  Fifteen Pieces
//
//  Created by Maxim Dvortsov on 13.11.2017.
//  Copyright © 2017 Maxim Dvortsov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var myButton : UIButton!
    var mypiece: UIButton!
    
    
    
    // Слой градиента
    var gradientLayer: CAGradientLayer! {
        didSet {
            gradientLayer.startPoint = CGPoint(x: 0, y: 0) // 0 0 левый верхний угол
            gradientLayer.endPoint = CGPoint(x: 0, y: 1) // 0 1 левый нижний угол
            
            let startColor = #colorLiteral(red: 1, green: 0.3871094503, blue: 0.3616123583, alpha: 1).cgColor
            let endColor = #colorLiteral(red: 0.8941176471, green: 0.3137254902, blue: 0.262745098, alpha: 1).cgColor
            gradientLayer.colors = [startColor, endColor]
            //gradientLayer.locations = [0, 0.1, 1]
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        
        gradientLayer.frame = self.view.bounds
    }
    
    
    
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        let gameBoard = Board(rows: 4, columns: 4)
        let gbView = gameBoard.printBoard(view: self.view)
        
        for piece in gameBoard.pieces {
            if piece.number < 16 {
                
                mypiece = piece.printPiece(boardView: gbView)
                let pgr = UIPanGestureRecognizer(target: self, action: #selector(self.dragAndDrop(_:)))
                mypiece.isUserInteractionEnabled = true
                mypiece.addGestureRecognizer(pgr)
                
                
                print("\(piece.col, piece.row ,piece.positionOnBoard, piece.number)")
            }
        }
        
        
        // кнопка для перетаскивания
        
        let rectf = CGRect(x: 20, y: 20, width: 200, height: 100)
        myButton = UIButton(frame: rectf)
        myButton.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        myButton.setTitle("title", for: .normal)
        myButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        myButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(myButton)
        
        //let pgr = UIPanGestureRecognizer(target: self, action: #selector(self.dragAndDrop(_:)))
        //myButton.isUserInteractionEnabled = true
        //self.myButton.addGestureRecognizer(pgr)
        
    }

    
    
    
    @objc func buttonAction(_ sender: UIButton) {
        showAlertController()
    }
    
    

    
    //MARK: - MemoryWarning
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // метод перетаскивания
    
    @objc func dragAndDrop(_ sender: UIPanGestureRecognizer) {
        self.view.bringSubview(toFront: mypiece)
        let translation = sender.translation(in: self.view)
        mypiece.center = CGPoint(x: mypiece.center.x + translation.x, y: mypiece.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    
    
    func showAlertController() {
        let ac = UIAlertController(title: "You are win", message: "message for friend", preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ac.addAction(cancelAction)
        ac.addAction(okAction)
        self.present(ac, animated: true, completion: nil)
    }
}
