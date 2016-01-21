//
//  TaskCell.swift
//  TaskIt
//
//  Created by Agrim Singh on 20/1/16.
//  Copyright © 2016 Agrim Singh. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var taskLabel: UIView!
    @IBOutlet weak var subtaskLabel: UILabel!

    @IBOutlet weak var dateLabel: UILabel!
}
