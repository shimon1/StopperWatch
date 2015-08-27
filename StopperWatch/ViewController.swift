//
//  ViewController.swift
//  StopperWatch
//
//  Created by shimonperetz on 5/10/15.
//  Copyright (c) 2015 shimonperetz. All rights reserved.
//

import UIKit

var objects: Int?

class ViewController: UIViewController{
    
 
    
 
    var isclicked = false
    var timer: NSTimer?
    var time = 0.00
    
    override func viewDidLoad(){
    var defualts = NSUserDefaults.standardUserDefaults()
        objects = defualts.integerForKey("Obj")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    @IBAction func buttonStart(sender: AnyObject) {
        if isclicked == false{
            isclicked = true
            start.setTitle("stop", forState: UIControlState.Normal)
            timer = NSTimer.scheduledTimerWithTimeInterval(0.00, target: self, selector: Selector("tick"), userInfo: nil, repeats: true);
        }else{
            isclicked = false
            start.setTitle("start", forState: UIControlState.Normal)
            timer?.invalidate()
            
        }
    }
    
   
    
    

    @IBAction func save(sender: AnyObject) {
        
       objects!++
        var defualts = NSUserDefaults.standardUserDefaults()
        defualts.setObject(label.text, forKey:
            objects!.description)
        defualts.setInteger(objects!, forKey: "Obj")
    
    }
    

    @IBAction func restart(sender: AnyObject) {
        time = 0;
        label.text = time.description
    }
    func tick(){
        time += 0.01
        label.text = String(format: "%.2f", time)
    }
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var start: UIButton!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }

    
   
}


