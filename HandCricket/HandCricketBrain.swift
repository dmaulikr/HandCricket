//
//  HandCricketBrain.swift
//  HandCricket
//
//  Created by Vineet Baid on 3/18/16.
//  Copyright © 2016 Vineet Baid. All rights reserved.
//

import Foundation

struct HandCricketBrain {
    
    
    
    enum style {
        
        case aggressive
        case medium
        case passive
        
    }
    
    var randomnumber : Int {
        get {
            return [1,2,3,4,5,5,6,6][Int(arc4random_uniform(8)+0)]
        }
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
}



