//
//  ViewController.swift
//  Noughts and Crosses
//
//  Created by Mehmet Ragıp Altuncu on 18/01/16.
//  Copyright © 2016 MehmetAltuncu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1
    
    var gameBoard = [0,0,0,0,0,0,0,0,0]
    
    var isGameActive = true
    
    var winningConditions = [//Horizontal
                            [0,1,2],[3,4,5],[6,7,8],
                            //Vertical
                            [0,3,6],[1,4,7],[2,5,8],
                            //Diagonal
                            [0,4,8],[2,4,6]
                            ]
    
    
    @IBOutlet weak var playAgainLabel: UIButton!

    @IBOutlet weak var endGameLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        endGameLabel.hidden = true
        playAgainLabel.hidden = true
    }


    @IBAction func buttonPressed(sender: UIButton) {
        
        if isGameActive == true {
            
            if gameBoard[sender.tag] == 0 {
                
                gameBoard[sender.tag] = activePlayer
                
                if activePlayer == 1 {
                    
                    sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
                    
                    activePlayer = 2
                    
                    
                }else if activePlayer == 2 {
                    
                    sender.setImage(UIImage(named: "nought.png"), forState: .Normal)
                    
                    activePlayer = 1
                }
                
                
                
            }
            
            
            
            
            //check for a winner
            for condition in winningConditions {
                
                if gameBoard[condition[0]] != 0 && gameBoard[condition[0]] == gameBoard[condition[1]] && gameBoard[condition[1]] == gameBoard[condition[2]] {
                    
                    if gameBoard[condition[0]] == 1 {
                        
                        isGameActive = false
                        endGameLabel.text = "Crosses Won"
                        endGameLabel.hidden = false
                        playAgainLabel.hidden = false
                        
                        
                    }else {
                        
                        isGameActive = false
                        endGameLabel.text = "Noughts Won"
                        endGameLabel.hidden = false
                        playAgainLabel.hidden = false
                    }
                    
                }
                
            }//end of winningConditions loop
            
            if isGameActive == true {
                
                //check for a draw
                isGameActive = false
                for x in gameBoard {
                    if x == 0 {
                        isGameActive = true
                    }
                }
                
                if isGameActive == false {
                    
                    endGameLabel.text = "It is a Draw"
                    endGameLabel.hidden = false
                    playAgainLabel.hidden = false
                }

                
            }
        }
        
    }//end of buttonPressed

    @IBAction func playAgainPressed(sender: AnyObject) {
        
        gameBoard = [0,0,0,0,0,0,0,0,0]
        isGameActive = true
        endGameLabel.hidden = true
        playAgainLabel.hidden = true
        activePlayer = 1
        
        var buttonToClear : UIButton
        
        for var i = 0; i < 9; i++ {
            
           buttonToClear = view.viewWithTag(i) as! UIButton
            buttonToClear.setImage(nil, forState: .Normal)
            
        }
    }
    
    
}//end of class

