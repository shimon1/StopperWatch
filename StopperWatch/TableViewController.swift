//
//  TableViewController.swift
//  StopperWatch
//
//  Created by shimonperetz on 5/20/15.
//  Copyright (c) 2015 shimonperetz. All rights reservd.
//

import UIkit

var control = 0

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.dataSource = self;
        tableView.delegate = self;
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell",  forIndexPath: indexPath) as UITableViewCell
        
        let row = indexPath.row
        
        var key = objects!  - control
        control++
        
        var defuals = NSUserDefaults.standardUserDefaults()
        cell.textLabel?.text = defuals.stringForKey(key.description)
    
        cell.detailTextLabel?.text = "this is the subtitle"
        return cell
    }
    
    
    @IBOutlet var tableView: UITableView!
    
}