//
//  ViewController.swift
//  HandCricket
//
//  Created by Vineet Baid on 3/18/16.
//  Copyright © 2016 Vineet Baid. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    @IBAction func pick(sender: UIButton) {
        
    }
    
    @IBAction func unwindViewTwoView(sender: UIStoryboard) {
        print("It tried to unwind")
    }
    
    @IBOutlet weak var scoreViewer: UITextField!
    
    @IBOutlet var targetShower: UITextField!
    
    override func viewDidLoad() {
        batOrBowl.text! = batting ? "Batting" : "Bowling"
        print(batOrBowl.text)
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.54, green: 0.81, blue: 0.94, alpha: 1)
        
    }
    
    @IBOutlet var batOrBowl: UILabel!
    
    func doSomethingTestScoreReceived(data: Int) {
        if data > 0 && (score + data) <= target {
            score = score + data
            HandCricketBrain().delay(0.3) {
                self.scoreViewer.text = "\(self.score)"
            }
        }
            
        else if !secondInnings {
            target = score
            print(target)
            score = 0
            secondInnings = true
            HandCricketBrain().delay(0.3) {
                self.targetShower.text = "Target set of \(self.target)"
                self.scoreViewer.text = ""
            }
            
            if batting {
                batOrBowl.text! = "Bowling"
                batting = false
                myScore = target
                print(myScore)
            }
                
            else if !batting {
                batOrBowl.text! = "Batting"
                batting = true
                compScore = target
                print(compScore)
            }
            
        }
            
        else if secondInnings {
            if batting {
                myScore = score + data
                print(myScore)
            }
                
            else if !batting {
                compScore = score + data
                print(compScore)
            }
            
            print("\(myScore) is my Score and \(compScore) is comp score")
            HandCricketBrain().delay(0.3) {
                self.scoreViewer.text = self.myScore>self.compScore ? "You Win" : "You Lose"
            }
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //All Variables
    
    var score: Int = 0
    var target: Int = 1000
    var batting : Bool = true
    var secondInnings: Bool = false
    var myScore = 0
    var compScore = 0
    // **** add this to make it so that you know when it's actually game over or not
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationViewController: ViewTwoViewController = segue.destinationViewController as! ViewTwoViewController
        destinationViewController.testSegue = Int((sender?.currentTitle!)!)!
        destinationViewController.batting2 = batting
        destinationViewController.secondInnings2 = secondInnings
        destinationViewController.sendScoreToView = {[weak self]
            (data) in
            if let weakSelf = self {
                weakSelf.doSomethingTestScoreReceived(data)
            }
            
        }
        
    }
    
    //*** should init to deinit
    
}




