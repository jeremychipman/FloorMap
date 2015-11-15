//
//  RoomCell.swift
//  FloorMap
//
//  Created by Jeremy Chipman on 11/15/15.
//  Copyright © 2015 Teus. All rights reserved.
//

import UIKit

class RoomCell: UITableViewCell {
 
    @IBOutlet weak var roomLabel: UILabel!
    
    @IBOutlet weak var floorLabel: UILabel!
    
    @IBOutlet weak var capacityLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
