//
//  ChooseBattingOrBowling.swift
//  HandCricket
//
//  Created by Vineet Baid on 3/18/16.
//  Copyright © 2016 Vineet Baid. All rights reserved.
//

import UIKit

class ChooseBattingOrBowling: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let mainViewController: ViewController = segue.destinationViewController as! ViewController
        if "\((sender!.currentTitle!)!)" == "Batting" {
            mainViewController.batting = true
            print(mainViewController.batting)
            
        }
        else if "\((sender!.currentTitle!)!)" == "Bowling" {
            mainViewController.batting = false
            print(mainViewController.batting)
        }
    }
    
}


