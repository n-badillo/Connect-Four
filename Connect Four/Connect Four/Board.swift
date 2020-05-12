//
//  Board.swift
//  Connect Four
//
//  Created by CSUFTitan on 5/11/20.
//  Copyright © 2020 Nancy Badillo. All rights reserved.
//

import UIKit
import GameplayKit

class Board: NSObject {
    static var width = 4
    static var height = 6
    
    var slots = [CircleColor]()
    
    //var currentPlayer: Player

    override init(){
        for _ in 0 ..< Board.width * Board.height{
            slots.append(.none)
        }
        
        //currentPlayer = Player.allPlayers[0]
        
        super.init()
    }
    
    func circle(inColumn column: Int, row: Int) -> CircleColor {
        return slots[row + column * Board.height]
    }
    
    func set(circle: CircleColor, in column: Int, row: Int) {
        slots[row + column * Board.height] = circle
    }
    
    func nextEmptySlot (in column: Int) -> Int? {
        for row in 0 ..< Board.height {
            if circle(inColumn: column, row: row) == .none{
                // If the row at the column is empty, return the row
                return row
            }
        }
        return nil  // If it doesn't have an empty row available, return nil
    }
    
    func canMove(in column: Int) -> Bool {
        return nextEmptySlot(in: column) != nil
        // If there is space in the row, then that is a vaild move
    }
    
    func add(circle: CircleColor, in column: Int){
        if let row = nextEmptySlot(in: column){
            // Since the next slot is a vaild move, you can add the players circle to the row/column
            set(circle: circle, in: column, row: row)
        }
    }
}
