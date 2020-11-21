//
//  NoteViewCell.swift
//  NoteAppRealm
//
//  Created by Mahmoud Morsy on 11/21/20.
//

import UIKit

class NoteViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var note: UILabel!
    @IBOutlet weak var dateCreated: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
