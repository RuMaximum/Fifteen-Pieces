//
//  ViewController.swift
//  Fifteen Pieces
//
//  Created by Maxim Dvortsov on 13.11.2017.
//  Copyright © 2017 Maxim Dvortsov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
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
        
        gradientLayer.frame = CGRect(x: 0,
                                     y: 0,
                                     width: self.view.bounds.size.width,
                                     height: self.view.bounds.size.height)
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
                piece.printPiece(boardView: gbView)
            }
        }
        
    }
    

    
    //MARK: - MemoryWarning
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
}
