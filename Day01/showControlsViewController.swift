//
//  showControlsViewController.swift
//  Day01
//
//  Created by imac on 4/19/16.
//  Copyright © 2016 zhang_dongdong. All rights reserved.
//

import UIKit

class showControlsViewController: UIViewController,UITextFieldDelegate {

    var numControls:UITextField!
    var percentageLabel:UILabel!
//    var totalLabel:UILabel!
    var nameLabel:UILabel!
//    let nameLabel1:UILabel!
    var maxValue : Float!
    var slider:UISlider!
    var transButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Calculate"
        self.view.backgroundColor = UIColor.whiteColor()
        self.setUpinit()
    }
    
    func setUpinit(){
        
        self.maxValue = 1
        
        self.numControls = UITextField()
        self.numControls.frame = CGRectMake(60, 100, 200, 100)
        self.numControls.placeholder = "$1.0"
        self.numControls.backgroundColor = UIColor.clearColor()
        self.numControls.delegate = self
        self.numControls.textAlignment = NSTextAlignment.Right
        self.numControls.font = UIFont.systemFontOfSize(30)
        self.numControls.textColor = UIColor.blackColor()
        self.numControls.clearButtonMode = UITextFieldViewMode.Always
        self.numControls.keyboardType = UIKeyboardType.PhonePad
        self.view.addSubview(self.numControls!)
        
        self.nameLabel = UILabel()
        self.nameLabel.frame = CGRectMake(60, 230, 100, 30)
        self.nameLabel.text = "TotalNum:"
        self.nameLabel.textColor = UIColor.blackColor()
        self.nameLabel.backgroundColor = UIColor.clearColor()
        self.view.addSubview(self.nameLabel!)
        
        self.percentageLabel = UILabel()
        self.percentageLabel.frame = CGRectMake(180, 230, 100, 30)
        self.percentageLabel.text = "0"
        self.percentageLabel.textColor = UIColor.blackColor()
        self.percentageLabel.backgroundColor = UIColor.clearColor()
        self.view.addSubview(self.percentageLabel!)

        self.slider = UISlider()
        self.slider.frame = CGRectMake(60, 300, 300 , 20)
        self.slider.maximumValue = self.maxValue
        self.slider.addTarget(self, action:#selector(showControlsViewController.sliderValueChang(_:)), forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(self.slider!)
        
        
        self.transButton = UIButton()
        self.transButton!.frame = CGRectMake(120, 600, 200, 30)
        self.transButton!.backgroundColor = UIColor.lightGrayColor()
        self.transButton.setTitle("跳转", forState: UIControlState.Normal)
        self.transButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        self.transButton.addTarget(self, action: #selector(showControlsViewController.transButtonClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(self.transButton!)
        
        
    }
    
    func transButtonClick(sender:UIButton){
    
    self.navigationController?.pushViewController(TableViewLearn(), animated: true)
    
    }
    
    func sliderValueChang(slider:UISlider){

        let value = Float(slider.value)
        self.nameLabel.text = "Num:\(String(format:"%.2f",value))"
        let percentage = value/self.maxValue*100
        self.percentageLabel.text = String(format:"%.1f",percentage)
        
    }
    
}
