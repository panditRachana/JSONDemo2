//
//  CellData.swift
//  JSONDemo2
//
//  Created by Rachana Pandit on 19/11/22.
//

import UIKit

class CellData: UITableViewCell {
    @IBOutlet weak var lblId:UILabel!
    @IBOutlet weak var lblFirstName:UILabel!
    @IBOutlet weak var imgAvatar:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
