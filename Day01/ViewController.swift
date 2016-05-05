//
//  ViewController.swift
//  Day01
//
//  Created by imac on 4/19/16.
//  Copyright © 2016 zhang_dongdong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var labelNum:UILabel!
    var timingLabelNum:UILabel!
    var tapEvent:UITapGestureRecognizer!
    var timer:NSTimer!
    var transButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "TapCount"
        self.setupInit()
    }
    
    func setupInit(){
        
        self.labelNum = UILabel()
        self.labelNum.frame = CGRectMake(120, 300, 200, 30)
        self.labelNum.backgroundColor = UIColor.lightGrayColor()
        self.labelNum.textColor = UIColor.blackColor()
        self.labelNum.text = "0"
        self.labelNum.textAlignment = NSTextAlignment.Center
        self.labelNum.userInteractionEnabled = true
        self.view.addSubview(self.labelNum!)
        
        
        self.timingLabelNum = UILabel()
        self.timingLabelNum!.frame = CGRectMake(120, 400, 200, 30)
        self.timingLabelNum!.backgroundColor = UIColor.lightGrayColor()
        self.timingLabelNum!.textColor = UIColor.blackColor()
        self.timingLabelNum!.text = "0"
        self.timingLabelNum!.textAlignment = NSTextAlignment.Center
        self.timingLabelNum!.userInteractionEnabled = true
        self.view.addSubview(self.timingLabelNum!)

        
        self.tapEvent = UITapGestureRecognizer()
        self.tapEvent.addTarget(self, action: #selector(ViewController.tapEvent(_:)))
        self.tapEvent.numberOfTapsRequired = 1
        self.labelNum.addGestureRecognizer(self.tapEvent!)
        
        self.timer  = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.timerFireMethod(_:)), userInfo: nil, repeats: true)
        self.timer.fire()
        
        
        self.transButton = UIButton()
        self.transButton!.frame = CGRectMake(120, 600, 200, 30)
        self.transButton!.backgroundColor = UIColor.lightGrayColor()
        self.transButton.setTitle("跳转", forState: UIControlState.Normal)
        self.transButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        self.transButton.addTarget(self, action: #selector(ViewController.transButtonClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(self.transButton!)

    
    }
    
    func transButtonClick(sender:UIButton){
    
    self.navigationController?.pushViewController(showControlsViewController(), animated: true)
    }
    
    func tapEvent(sender:UITapGestureRecognizer){
        
         let  textNum = Int(self.labelNum.text!)
          self.labelNum.text = "\(textNum! + 1)"
        
    }
    
    func timerEvent(){
    
        let  textNum = Int(self.timingLabelNum.text!)
        self.timingLabelNum.text = "\(textNum! + 1)"
        
    }
    
    func timerFireMethod(timer: NSTimer) {
        let formatter = NSDateFormatter();
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let strNow = formatter.stringFromDate(NSDate())
        self.timingLabelNum.text  = "\(strNow)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

