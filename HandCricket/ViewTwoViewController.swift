//
//  ViewTwoViewController.swift
//  HandCricket
//
//  Created by Vineet Baid on 3/18/16.
//  Copyright © 2016 Vineet Baid. All rights reserved.
//

import UIKit


class ViewTwoViewController: UIViewController {
    
    @IBOutlet var playViewer: UILabel!
    @IBAction func backToViewController(sender: UIButton) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    var sendScoreToView : ((data: Int) -> ())?
    
    func sendScoreBack (data: Int) {
        self.sendScoreToView?(data: data)
    }
    
    @IBOutlet var computerPick: UILabel!
    @IBOutlet var testOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // call the class to find a random number
        let computerPickScore = HandCricketBrain().randomnumber
        
        // test outlet is the number that the user selected
        testOutlet.text = "\(testSegue)"
        
        computerPick.text = "\(computerPickScore)"
        
        if testSegue == computerPickScore {
            playViewer.text = "Out!"
            returnValue = 0
            sendScoreBack(returnValue!)
            if secondInnings2 {
                performSegueWithIdentifier("GameOver", sender: nil)
            }
        }
        else {
            playViewer.text = batting2 ? "You hit \(testSegue) Runs" : "Computer hit \(computerPickScore) Runs"
            returnValue = batting2 ? testSegue : computerPickScore
            sendScoreBack(returnValue!)
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    var testSegue : Int = 0
    var computerPickScore : Int = 0
    var returnValue : Int?
    var batting2 : Bool = false
    var secondInnings2 : Bool = false
    
    // ** should init
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}


