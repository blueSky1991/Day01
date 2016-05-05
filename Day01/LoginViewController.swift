//
//  LoginViewController.swift
//  test01
//
//  Created by imac on 16/4/11.
//  Copyright © 2016年 zhang_dongdong. All rights reserved.
//

import UIKit

typealias sendValueClosure = (String,String)->Void//block

protocol LoginViewControllerDelagate{
    func requestLoginInfo(str1:String,str2:String)
}

class LoginViewController: UIViewController,UITextFieldDelegate {
    
    var username:UITextField?
    var password:UITextField?
    var loginBtn: UIButton?
    var delagate:LoginViewControllerDelagate?
    var userNameInfo:String?
    var passWordInfo:String?

    var sendBlock:sendValueClosure?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.setup()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func setup(){
        
        let user:UILabel = UILabel()
        user.frame = CGRectMake(50, 100, 50, 30)
        user.text = "用户名:"
        user.font = UIFont.systemFontOfSize(15)
        user.textColor = UIColor.grayColor()
        self.view.addSubview(user)
        
        self.username = UITextField()
        self.username?.frame = CGRectMake(120, 100, 150, 30)
        self.username?.placeholder = "请在此输入用户名"
        self.username?.delegate = self
        self.username?.tag = 101
        self.view.addSubview(self.username!)
        
        let password:UILabel = UILabel()
        password.frame = CGRectMake(50, 150, 50, 30)
        password.text = "密 码:"
        password.font = UIFont.systemFontOfSize(15)
        password.textColor = UIColor.grayColor()
        self.view.addSubview(password)
        
        self.password = UITextField()
        self.password?.frame = CGRectMake(120, 150, 150, 30)
        self.password?.placeholder = "请在此输入密码"
        self.password?.delegate = self
        self.password?.tag = 102
        self.password?.secureTextEntry = true
        self.view.addSubview(self.password!)
        
        
        let btn:UIButton = UIButton()
        btn.backgroundColor = UIColor.redColor()
        btn.frame = CGRectMake(100, 190, 150, 30)
        btn.setTitle("登陆", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
        btn.addTarget(self,action:#selector(LoginViewController.login),forControlEvents:UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)

    }
    
    
    internal  func initBack(sendValueClosure:(string:String,string1:String)->Void ){
        self.sendBlock = sendValueClosure
    }


    func login(){
        
        if self.username?.text == nil || self.password?.text == nil {
            return
        }
        
        self.navigationController?.pushViewController(ViewController(), animated: true)
    }
    

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        switch textField.tag{
        case 101:
            self.userNameInfo = textField.text
            break
        case 102:
            self.passWordInfo = textField.text
            break
        default:
            break
            
        }
        
        return true
    }
    
    
    deinit{
        print("控制器:\(#function)行数:\(#line)")
    }

    
    
    
}
