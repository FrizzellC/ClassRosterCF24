//
//  DetailViewController.swift
//  ClassRoster
//
//  Created by chantel Frizzell on 11/9/14.
//  Copyright (c) 2014 NOidea. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, NSCoding {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var firstName: UITextField!
    var name = ""
    
    @IBOutlet weak var lastName: UITextField!
    var last = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstName.delegate = self

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
    
    @IBAction func updateImageClicked(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            var imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
            imagePickerController.delegate = self
            imagePickerController.allowsEditing = true
            self.presentViewController(imagePickerController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        let image = editingInfo[UIImagePickerControllerEditedImage] as UIImage
        self.imageView.image = image
        
        self.dismissViewControllerAnimated(true, completion: nil)
        self.imageView.image = image
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
