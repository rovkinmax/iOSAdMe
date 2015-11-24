//
//  FirstViewController.swift
//  Adme
//
//  Created by Maxim Rovkin on 24.11.15.
//  Copyright © 2015 Maxim Rovkin. All rights reserved.
//

import UIKit

class FirstViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("rssCell", forIndexPath: indexPath)

        cell.textLabel?.text = "Row \(indexPath.row)"
        return cell
    }
}
