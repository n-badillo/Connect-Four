//
//  ViewController.swift
//  Connect Four
//
//  Created by CSUFTitan on 5/11/20.
//  Copyright © 2020 Nancy Badillo. All rights reserved.
//

import GameplayKit
import UIKit

enum CircleColor: Int{
    case none = 0
    case red
    case yellow
}

class ViewController: UIViewController {

    
    @IBOutlet var columns: [UIButton]!
    
    var placedCircles = [[UIView]]()
    var board: Board!
    
    @IBAction func makeMove(_ sender: UIButton) {
        let column = sender.tag
        if let row = board.nextEmptySlot(in: column){
            board.add(circle: .red, in: column)
            addCircle(inColumn: column, row: row, color: .red)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0 ..< Board.width{
            placedCircles.append([UIView]())
        }
        
        resetBoard()
    }
    
    func resetBoard(){
        board = Board()
        
        for i in 0 ..< placedCircles.count {
            for circlePlaced in placedCircles[i]{
                circlePlaced.removeFromSuperview()
            }
            
            placedCircles[i].removeAll(keepingCapacity: true)
        }
    }

    func addCircle (inColumn column: Int, row: Int, color: UIColor){
        let button = columns[column]
        let size = min(button.frame.width, button.frame.height / 4)
        let rect = CGRect(x: 0, y:0, width: size, height: size)
        
        if (placedCircles[column].count < row + 1){
            let newCircle = UIView()
            newCircle.frame = rect
            newCircle.isUserInteractionEnabled = false
            newCircle.backgroundColor = color
            newCircle.layer.cornerRadius = size/2
            newCircle.center = positionForCircle(inColumn: column, row: row)
            //newCircle.transform = CGAffineTransform(transaltionX: 0, y: -800)
            view.addSubview(newCircle)
            
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
                newCircle.transform = CGAffineTransform.identity
            })
            
            placedCircles[column].append(newCircle)
        }
    }
    
    func positionForCircle(inColumn column: Int, row: Int) -> CGPoint {
        let button = columns[column]
        let size = min(button.frame.width, button.frame.height / 4)
        let xOffset = button.frame.midX
        var yOffset = button.frame.maxY - size / 2
        yOffset -= size * CGFloat(row)
        return CGPoint(x: xOffset, y: yOffset)
    }

}

