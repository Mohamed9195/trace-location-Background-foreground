//
//  LocationCell.swift
//  trace_LocationGPS
//
//  Created by mohamed hashem on 9/26/19.
//  Copyright © 2019 mohamed hashem. All rights reserved.
//

import UIKit

class LocationCell: UITableViewCell {

    @IBOutlet weak var locationCoordinate: UILabel!
    @IBOutlet weak var locationSpeed: UILabel!
    @IBOutlet weak var locationAccuracy: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
