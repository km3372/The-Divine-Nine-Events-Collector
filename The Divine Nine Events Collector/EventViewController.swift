//
//  EventViewController.swift
//  The Divine Nine Events Collector
//
//  Created by Ken Moody on 3/6/17.
//  Copyright © 2017 Ken Moody. All rights reserved.
//

import UIKit

class EventViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var eventImageView: UIImageView!
    
    
    @IBOutlet weak var titleTextsField: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        
    }

    
    @IBAction func photosTapped(_ sender: Any) {
    }
    
    
    @IBAction func cameraTapped(_ sender: Any) {
    }
    
    @IBAction func addTapped(_ sender: Any) {
    }
}
