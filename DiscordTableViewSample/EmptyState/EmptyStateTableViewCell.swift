//
//  EmptyStateTableViewCell.swift
//  DiscordTableViewSample
//
//  Created by Yamada Shunya on 2019/08/06.
//  Copyright © 2019 Yamada Shunya. All rights reserved.
//

import UIKit

class EmptyStateTableViewCell: UITableViewCell {
    
    // MARK: IBOutlet
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    // MARK: Properties
    
    static let reuseIdentifier = "EmptyStateTableViewCell"
    static let rowHeight: CGFloat = 108
    static var nib: UINib {
        return UINib(nibName: "EmptyStateTableViewCell", bundle: nil)
    }
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: UI
    
    func setupCell(image: UIImage?, title: String, desc: String, number: Int) {
        mainImageView.image = image
        titleLabel.text = title
        descriptionLabel.text = desc
        numberLabel.text = "\(number)"
    }
}
