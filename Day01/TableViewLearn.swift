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
    var navButton :UIButton!
    
    var dataSource:[String] = ["西游记","水浒传","红楼梦","三国演义"]
    let width =  UIScreen.mainScreen().bounds.size.width
    let height =  UIScreen.mainScreen().bounds.size.height
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "DataSourceCount"
        self.setupInit()
        self.editorButtonSet()
    }
    
    func  editorButtonSet (){
       self.navButton  = UIButton()
        self.navButton.frame = CGRectMake(0, 0, 50, 60)
       self.navButton.setTitle("Editor", forState: UIControlState.Normal)
        self.navButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        self.navButton.addTarget(self, action: #selector(TableViewLearn.editorButtonDidClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
         let rightItem = UIBarButtonItem()
        rightItem.customView = self.navButton
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    func editorButtonDidClick(btn: UIButton) {
//        print("editorButtonDidClick")
        self.tableView.setEditing(!self.tableView.editing, animated: true)
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
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        return true
    }
    
    
     func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            dataSource.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
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
