//
//  ViewController.swift
//  The Divine Nine Events Collector
//
//  Created by Ken Moody on 3/6/17.
//  Copyright © 2017 Ken Moody. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    
    var events :[Photos] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()

            tableView.dataSource = self
            tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate) .persistentContainer.viewContext
        
        do {
            events = try context.fetch(Photos.fetchRequest())
            tableView.reloadData()
            
        } catch {
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let event = events[indexPath.row]
        cell.textLabel?.text = event.title
        cell.imageView?.image = UIImage(data: event.image as! Data)
        
        return cell
    }
}
