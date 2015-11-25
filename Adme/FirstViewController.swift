//
//  FirstViewController.swift
//  Adme
//
//  Created by Maxim Rovkin on 24.11.15.
//  Copyright © 2015 Maxim Rovkin. All rights reserved.
//

import UIKit
import RxSwift

class FirstViewController: UITableViewController {
    private var rssItem = [RssItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        _ = Api.loadRss()
        .subscribe(
        onNext: {
            rssItemArray in
            print("count of rss item = \(rssItemArray.count)")
            self.rssItem += rssItemArray
            self.tableView.reloadData()
        }, onError: {
            error in
            print(error)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rssItem.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("rssCell", forIndexPath: indexPath)

        cell.textLabel?.text = rssItem[indexPath.row].title
        return cell
    }
}
