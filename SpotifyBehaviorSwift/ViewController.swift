//
//  ViewController.swift
//  SpotifyBehaviorSwift
//
//  Created by Juan Pablo Lazcano on 8/17/15.
//  Copyright (c) 2015 Juan Pablo Lazcano. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var coverTopConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.headerView.clipsToBounds = true
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("playlist") ?? UITableViewCell()
        cell.textLabel?.text = "High Hopes"
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 80
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        
        if scrollView.contentOffset.y > 44{
            if self.searchView.alpha == 1{
                UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: .CurveLinear, animations: { () -> Void in
                    self.searchView.alpha = 0
                    }, completion: { (done:Bool) -> Void in
                        
                })
            }
            
            self.coverTopConstraint.constant = max(0, scrollView.contentOffset.y - 44)
        }
        else{
            self.searchView.alpha = 1.0
        }
        
    }
}

