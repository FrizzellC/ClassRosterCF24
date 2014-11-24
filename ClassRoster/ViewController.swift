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
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.loadFromPlist()
        self.title = "Roster"
            
//        var Eric = Person(first: "Eric", last: "Mentele", student: true)
//        var Edward = Person(first: "Edward", last: "Abrahamsen", student: true)
//        var Clint = Person(first: "Clint", last: "Akins", student: true)
//        var Joseph = Person(first: "Joseph", last: "Barnes", student: true)
//        var Brian = Person(first: "Brian", last: "Ledbetter", student: true)
//        var Adam = Person(first: "Adam", last: "Caldwell", student: true)
//        let Ryan = Person(first: "Ryan", last: "Christensen", student: true)
//        let Daniel = Person(first: "Daniel", last: "Hour", student: true)
//        let Chantel = Person(first: "Chantel", last: "Frizzel", student: true)
//        let David = Person(first: "David", last: "Fry", student: false)
//        let Jeff = Person(first: "Jeffq", last: "Hendershot", student: true)
//        let Brad = Person(first: "Brad", last: "Johnson", student: false)
//        let Scott = Person(first: "Scott", last: "Kendall", student: true)
//        let Denise = Person(first: "Denise", last: "Koch", student: true)
//        let Michael = Person(first: "Michael", last: "Labaz", student: true)
//        let Patrick = Person(first: "Patrick", last: "Landin", student: true)
//        let Robert = Person(first: "Robert", last: "Lee", student: true)
//        let John = Person(first: "John", last: "Leonard", student: true)
//        let Lindy = Person(first: "Lindy", last: "Merida", student: false)
//        let Duncan = Person(first: "Duncan", last: "Marsh", student: true)
//        let Lance = Person(first: "Lance", last: "Park", student: true)
//        let Andrewp = Person(first: "Andrew", last: "Potter", student: true)
//        let Andrewr = Person(first: "Andrew", last: "Reifers", student: true)
//        let Doc = Person(first: "Doctor", last: "Schwenk", student: true)
//        let Stephen = Person(first: "Stephen", last: "Doe", student: true)
//        let Mystery = Person(first: "Mystery", last: "Maddocks", student: true)
//        
//        self.people = [Adam, Andrewr, Andrewp, Brad, Brian, Chantel, Clint, Daniel, David, Denise, Doc, Duncan, Edward, Eric, Jeff, John, Joseph, Lance, Lindy, Michael, Mystery, Patrick, Robert, Ryan, Scott, Stephen]
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func loadFromPlist() {
        let plistURL = NSBundle.mainBundle().pathForResource("Roster", ofType: "plist")
        let plistArray = NSArray(contentsOfFile: plistURL!)
        for object in plistArray!
        {
            println("looped")
            if let personDictionary = object as? NSDictionary
                
            {
                let firstName = personDictionary["firstName"] as String
                let lastName = personDictionary["lastName"] as String
                let student = personDictionary["student"] as Bool
                var person = Person(first: firstName, last: lastName, student: student)
                self.people.append(person)
            }//if let
        }//loop
    }//Load from plist
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PERSON_CELL", forIndexPath: indexPath) as UITableViewCell
        
        var personToDisplay = self.people[indexPath.row]
        cell.textLabel.text = personToDisplay.firstName
        cell.imageView.image = personToDisplay.image
        
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
            let selectedIndexPath = self.tableView.indexPathForSelectedRow()
            var personToPass = self.people[selectedIndexPath!.row]
            detailViewController.selectedPerson = personToPass
            
            detailViewController.name = personClickedFirst
            detailViewController.last = personClickedLast
        }
    }
}




// var personToDisplay = self.name[indexPath.row]
//cell.textLabel.text = personToDisplay.name
//return cell