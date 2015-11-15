//
//  RoomFinderViewController.swift
//  FloorMap
//
//  Created by Jeremy Chipman on 11/12/15.
//  Copyright © 2015 Teus. All rights reserved.
//

import UIKit

class RoomFinderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var peopleSegment: UISegmentedControl!
    
    @IBOutlet weak var timeSegment: UISegmentedControl!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var findButton: UIButton!
    
    @IBOutlet weak var peopleLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var rooms: [String]!
    var floors: [String]!
    var capacity: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rooms = ["Conf Rm A", "Conf Rm B", "Conf Rm C", "Training Room", "User Research Room"]
        floors = ["1st floor"]
        capacity = ["20", "50", "100"]
        print(rooms[0])
        print(rooms[1])
        print(rooms[2])
        print(rooms[3])
        print(rooms[4])
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        // Dispose of any resources that can be recreated.
    }
    
    //        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    
    
    @IBAction func onPressButton(sender: AnyObject) {
        self.activityIndicator.startAnimating()
        // Delay for 2 seconds, then run the code between the braces
        delay(2) {
            self.activityIndicator.stopAnimating()
            var peopleNumbers = ["2-4", "5-10", ">10"]
            let peopleNumber = peopleNumbers[self.peopleSegment.selectedSegmentIndex]
            var timeNumbers = ["15 min", "30 min", "1 hr", ">1 hr"]
            let timeNumber = timeNumbers[self.timeSegment.selectedSegmentIndex]
            self.peopleLabel.text = "Rooms for \(peopleNumber) people"
            self.timeLabel.text = "available for \(timeNumber)"
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RoomCell") as! RoomCell
        
        // Configure YourCustomCell using the outlets that you've defined.
        var room = rooms[indexPath.row]
//        var floor = floors[indexPath.row]
//        var capacities = capacity[indexPath.row]
    
        cell.roomLabel.text = room
//        cell.floorLabel.text = floor
//        cell.capacityLabel.text = capacities
//        
        print("row: \(indexPath.row)")
        
        return cell
    }
    //            let destViewController : AvailableRoomsViewController = segue.destinationViewController as! AvailableRoomsViewController
    
    //            destViewController.peopleLabeltext = peopleNumber
    //
    //            destViewController.view.layoutIfNeeded()
    //
    //            destViewController.timeLabel.text = timeNumber
    //}
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
