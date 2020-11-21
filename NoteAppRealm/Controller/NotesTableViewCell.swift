//
//  NotesTableViewCell.swift
//  NoteAppRealm
//
//  Created by Mahmoud Morsy on 11/21/20.
//

import UIKit
import SwipeCellKit

class NotesTableViewCell: UITableViewCell {

    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellNote: UILabel!
    @IBOutlet weak var cellDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

