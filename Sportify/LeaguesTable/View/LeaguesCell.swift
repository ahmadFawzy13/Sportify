//
//  LeaguesCell.swift
//  Sportify
//
//  Created by Abdullah Raed on 11/05/2025.
//

import UIKit

class LeaguesCell: UITableViewCell {

    
    @IBOutlet weak var leagueTitle: UILabel!
    @IBOutlet weak var leagueLogo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
