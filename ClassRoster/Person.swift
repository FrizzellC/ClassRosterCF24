//
//  Person.swift
//  ClassRoster
//
//  Created by chantel Frizzell on 11/3/14.
//  Copyright (c) 2014 NOidea. All rights reserved.
//

import Foundation

class Person {
    
    var firstName = ""
    var lastName = ""
    var isStudent = true
    
    init(first : String, last : String, student : Bool) {
        self.firstName = first
        self.lastName = last
        self.isStudent = true
    }
    
    func fullName() -> String {
        return "\(firstName) \(lastName)"
        
    }
}


