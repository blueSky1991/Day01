//
//  TableViewLearn.swift
//  Day01
//
//  Created by imac on 16/4/20.
//  Copyright © 2016年 zhang_dongdong. All rights reserved.
//

import UIKit

class TableViewLearn: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var tableView:UITableView!
    var dataSource:[String] = ["xiyouji","shiuhuzhuan","honglongmeng","sanguoyanyi"]
    let width =  UIScreen.mainScreen().bounds.size.width
    let height =  UIScreen.mainScreen().bounds.size.height
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "DataSourceCount"
        self.setupInit()
        self.test()
    }
    
    func setupInit(){
         self.tableView = UITableView(frame: CGRectMake(0, 0, width, height), style: UITableViewStyle.Plain)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.view.addSubview(self.tableView!)
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
          var cell = tableView.dequeueReusableCellWithIdentifier("tableView")
        if cell == nil {
             cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "tableView")
        }
        cell?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
       cell?.textLabel?.text = dataSource[indexPath.row]
       return cell!
    }
    
    func test(){
        let  arr  = [1,2,5,8]
        let brr = arr.map {
            $0 * 2
            } .map {
            "this is " + String($0)
            } .map {
            $0.uppercaseString
            }.flatMap{
             $0
        }
    
        print("brr\(brr.debugDescription)")
        
    }
    
    
    
}
