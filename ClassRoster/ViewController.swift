//
//  ViewController.swift
//  ClassRoster
//
//  Created by chantel Frizzell on 11/3/14.
//  Copyright (c) 2014 NOidea. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    var people = [Person]()
    
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "" {
            let detailViewController = segue.destinationViewController as DetailViewController
            let selectedIndexpath = self.tableView.indexPathForSelectedRow()
            var personToPass = self.people[selectedIndexpath!.row]
            detailViewController
        }
    }

}




// var personToDisplay = self.name[indexPath.row]
//cell.textLabel.text = personToDisplay.name
//return cell