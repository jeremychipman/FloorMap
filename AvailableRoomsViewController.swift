//
//  AvailableRoomsViewController.swift
//  FloorMap
//
//  Created by Jeremy Chipman on 11/12/15.
//  Copyright © 2015 Teus. All rights reserved.
//

import UIKit

class AvailableRoomsViewController: UIViewController {

    @IBOutlet weak var peopleLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    var peopleLabeltext = String ()
    var timeLabeltext = String ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
