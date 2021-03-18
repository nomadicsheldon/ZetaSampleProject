//
//  ListingDataCell.swift
//  ZetaAssignment
//
//  Created by Himanshu Rajput on 23/01/21.
//

import UIKit
import SDWebImage

class ListingDataCell: UITableViewCell {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    
    func populateView(with data: ItemModel?) {
        if let itemUrl = data?.pageMapModel.cseImageModel?[0].src {
            itemImage.sd_setImage(with: URL(string: itemUrl), placeholderImage: nil, options: .continueInBackground, completed: nil)
        }
        itemTitle.text = data?.title
    }
    
}
