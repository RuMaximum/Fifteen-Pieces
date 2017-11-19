//
//  ViewController.swift
//  Fifteen Pieces
//
//  Created by Maxim Dvortsov on 13.11.2017.
//  Copyright © 2017 Maxim Dvortsov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        let gameBoard = Board(rows: 4, columns: 4)
        let gbView = gameBoard.printBoard(view: self.view)
        
        for piece in gameBoard.pieces {
            piece.printPiece(boardView: gbView)
        }
        
    }
    

    
    //MARK: - MemoryWarning
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
}
