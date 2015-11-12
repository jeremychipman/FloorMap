//
//  RoomFinderViewController.swift
//  FloorMap
//
//  Created by Jeremy Chipman on 11/12/15.
//  Copyright © 2015 Teus. All rights reserved.
//

import UIKit

class RoomFinderViewController: UIViewController {

    @IBOutlet weak var peopleSegment: UISegmentedControl!
    
    @IBOutlet weak var timeSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var timeNumbers = ["15 min", "30 min", "1 hr", ">1 hr"]
        let timeNumber = timeNumbers[timeSegment.selectedSegmentIndex]
        var peopleNumbers = ["2-4", "5-10", ">10"]
        var peopleNumber = peopleNumbers[peopleSegment.selectedSegmentIndex]
        
        let destViewController : AvailableRoomsViewController = segue.destinationViewController as! AvailableRoomsViewController
        
        destViewController.view.layoutIfNeeded()
        
        destViewController.timeLabel.text = timeNumber
        destViewController.peopleLabel.text = peopleNumber
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
