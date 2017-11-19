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
        let mview = UIView(frame: rect)
        mview.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        view.addSubview(mview)
        return mview
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
    
    public func printPiece(boardView: UIView) {
        let viewWidth = boardView.frame.width
        let pieceSide = viewWidth * 0.225
        let offset = viewWidth * 0.02
        let rect = CGRect(x: offset * CGFloat(self.col) + pieceSide * CGFloat(self.col - 1), y: CGFloat(self.row) * offset + pieceSide * CGFloat(self.row - 1), width: pieceSide, height: pieceSide)
        let mview = UIView(frame: rect)
        mview.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        boardView.addSubview(mview)
    }
    
}
