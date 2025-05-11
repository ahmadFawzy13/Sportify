import UIKit

class FavouritesCustomCell: UITableViewCell {

    @IBOutlet weak var leagueTitle: UILabel!
    @IBOutlet weak var leagueLogo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
