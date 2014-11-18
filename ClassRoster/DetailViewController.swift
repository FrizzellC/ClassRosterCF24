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

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.imageView = selectedPerson.image
        self.firstName.delegate = self
        self.lastName.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
   
    
    @IBAction func updateImageClicked(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            var imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
            imagePickerController.delegate = self
            imagePickerController.allowsEditing = true
            self.presentViewController(imagePickerController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImageWithInfo info: [NSObject : AnyObject]) {
        let image = info[UIImagePickerControllerEditedImage] as UIImage
        self.imageView.image = image
        
        self.dismissViewControllerAnimated(true, completion: nil)
        self.imageView.image = image
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
