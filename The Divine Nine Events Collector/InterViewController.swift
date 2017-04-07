//
//  InterViewController.swift
//  The Divine Nine Events Collector
//
//  Created by Ken Moody on 3/6/17.
//  Copyright © 2017 Ken Moody. All rights reserved.
//

import UIKit

class InterViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var eventImageView: UIImageView!
    
    @IBOutlet weak var titleTextsField: UITextField!
    
    
    
    
    var imagePicker = UIImagePickerController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        
    }

    @IBAction func photosTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
       let image =  info[UIImagePickerControllerOriginalImage] as! UIImage
        
        eventImageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
   
    @IBAction func cameraTapped(_ sender: Any) {
    }
    
    
    @IBAction func addTapped(_ sender: Any) {
 
        
        let context = (UIApplication.shared.delegate as! AppDelegate) .persistentContainer.viewContext
       
        let eventPhotos = Photos(context: context)
        eventPhotos.title = titleTextsField.text
        eventPhotos.image = UIImagePNGRepresentation(eventImageView.image!) as NSData?
        
        (UIApplication.shared.delegate as! AppDelegate) .saveContext()
        
        navigationController!.popViewController(animated: true)
    
    }
}
