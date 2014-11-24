//
//  DetailViewController.swift
//  ClassRoster
//
//  Created by chantel Frizzell on 11/9/14.
//  Copyright (c) 2014 NOidea. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    
    var name = ""
    var last = ""
    var imagePickerController = UIImagePickerController()
    var selectedPerson = Person(first: "", last: "", student: true)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstName.text = selectedPerson.firstName
        self.lastName.text = selectedPerson.lastName
        if self.selectedPerson.image != nil {
            self.imageView.image = selectedPerson.image
        }
        self.firstName.delegate = self
        self.lastName.delegate = self

        // Do any additional setup after loading the view.
    }
    
    //remove keyboard when user presses return
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let image = info[UIImagePickerControllerEditedImage] as UIImage
        self.selectedPerson.image = image
        self.imageView.image = image
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func UpdateImageButton(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            var imagePickerController = UIImagePickerController()
            self.imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.imagePickerController.delegate = self
            self.imagePickerController.allowsEditing = true
            self.presentViewController(self.imagePickerController, animated: true, completion: nil)
        }
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
