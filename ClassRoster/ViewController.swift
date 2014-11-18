//
//  ViewController.swift
//  ClassRoster
//
//  Created by chantel Frizzell on 11/3/14.
//  Copyright (c) 2014 NOidea. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var people = [Person]()
    var personClickedFirst = ""
    var personClickedLast = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
    
        var person1 = Person(first: "Chantel", last: "Frizzell", student: true)
        var person2 = Person(first: "Brad", last: "Johnson", student: false)
        var person3 = Person(first: "Daniel", last: "Hour", student: true)
        
        people.append(person1)
        people.append(person2)
        people.append(person3)

        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.people.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PERSON_CELL", forIndexPath: indexPath) as UITableViewCell
        
        var personToDisplay = self.people[indexPath.row]
        cell.textLabel.text = personToDisplay.firstName
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //if this cell is clicked, store it here (create a place to store)
        personClickedFirst = self.people[indexPath.row].firstName
        personClickedLast = self.people[indexPath.row].lastName
        
        
        //use perforseguewithidentifier to send to dvc
        performSegueWithIdentifier("SeguePersonDetail", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SeguePersonDetail" {
            let detailViewController = segue.destinationViewController as DetailViewController
            
            detailViewController.name = personClickedFirst
            detailViewController.last = personClickedLast
        }
    }
}




// var personToDisplay = self.name[indexPath.row]
//cell.textLabel.text = personToDisplay.name
//return cell