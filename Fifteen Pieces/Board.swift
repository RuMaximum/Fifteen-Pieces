//
//  Piece.swift
//  Fifteen Pieces
//
//  Created by Maxim Dvortsov on 18.11.2017.
//  Copyright © 2017 Maxim Dvortsov. All rights reserved.
//

import UIKit
import Foundation


// MARK: - Game Board

final class Board {
    
    var pieces = [Piece]()
    let columns: Int
    let rows: Int
    var empty: Int
    
    
    init (rows: Int, columns: Int) {
        
        self.rows = rows
        self.columns = columns
        self.empty = rows * columns - 1
        
        var i = 1
        for row in 1...rows {
            for col in 1...columns {
                pieces.append(Piece(number: i, positionOnBoard: i, row: row, col: col))
                i += 1
            }
        }
    }
    
    public func printBoard(view: UIView) -> UIView {
        
        let viewWidth = view.frame.width
        let center = view.center
        let pieceSide = viewWidth * 0.98
        let rect = CGRect(x: viewWidth * 0.01, y: center.y - pieceSide / 2, width: pieceSide, height: pieceSide)
        let boardView = UIView(frame: rect)
        //mview.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        boardView.layer.borderWidth = 1
        boardView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        boardView.layer.masksToBounds = true
        boardView.layer.cornerRadius = 10
        view.addSubview(boardView)
        return boardView
        
    }
}

//MARK: - Game Pieces

final class Piece {
    
    let number: Int
    var positionOnBoard: Int
    let row: Int
    let col: Int
    
    init(number: Int, positionOnBoard: Int, row: Int, col: Int) {
        
        self.number = number
        self.positionOnBoard = positionOnBoard
        self.row = row
        self.col = col
        
    }
    
    public func printPiece(boardView: UIView) -> UIButton {
        
        let viewWidth = boardView.frame.width
        let pieceSide = viewWidth * 0.2375
        let offset = viewWidth * 0.01
        let rect = CGRect(x: offset * CGFloat(self.col) + pieceSide * CGFloat(self.col - 1), y: CGFloat(self.row) * offset + pieceSide * CGFloat(self.row - 1), width: pieceSide, height: pieceSide)
        
        let buttonView = UIButton(frame: rect)
        let image = UIImage(named: "Button")
        buttonView.setBackgroundImage(image, for: .normal)
        buttonView.setBackgroundImage(image, for: .highlighted)
        buttonView.setTitle("\(self.number)", for: .normal)
        buttonView.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
        //let pgr = UIPanGestureRecognizer(target: self, action: #selector(dragAndDrop(_:)))
        //buttonView.addGestureRecognizer(pgr)
        boardView.addSubview(buttonView)
        return buttonView
    }
}
