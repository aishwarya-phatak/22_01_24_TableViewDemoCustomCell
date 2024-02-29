//
//  MenuTableViewCell.swift
//  22_01_24_TableViewDemo4
//
//  Created by Vishal Jagtap on 29/02/24.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var menuItemImage: UIImageView!
    @IBOutlet weak var menuItemTitleLabel: UILabel!
    @IBOutlet weak var menuItemDescriptionLabel: UILabel!
    @IBOutlet weak var menuItemPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
