//
//  DetailViewController.swift
//  ClassRoster
//
//  Created by chantel Frizzell on 11/9/14.
//  Copyright (c) 2014 NOidea. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstName: UITextField!
    
    var name = ""
    
    
    @IBOutlet weak var lastName: UITextField!
    
    var last = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        firstName.text = name
//        lastName.text = last

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
