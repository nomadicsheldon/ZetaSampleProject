//
//  ItemDescriptionViewController.swift
//  ZetaAssignment
//
//  Created by Himanshu Rajput on 23/01/21.
//

import UIKit

class ItemDescriptionViewController: UIViewController {
    var itemModel: ItemModel?
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemSubTitle: UILabel!
    
    // MARK:- Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.populateUI()
    }
    
    // MARK:- Helper Methods
    private func populateUI() {
        if let itemDetail = itemModel {
            if let itemUrl = itemDetail.pageMapModel.cseImageModel?[0].src {
            self.itemImage.sd_setImage(with: URL(string: itemUrl), placeholderImage: nil, options: .continueInBackground, completed: nil)
            }
            self.itemTitle.text = itemDetail.title
            self.itemSubTitle.text = itemDetail.snippet
        }
    }
}
