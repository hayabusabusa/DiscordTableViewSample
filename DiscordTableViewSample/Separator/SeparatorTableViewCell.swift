//
//  SeparatorTableViewCell.swift
//  DiscordTableViewSample
//
//  Created by Yamada Shunya on 2019/08/05.
//  Copyright © 2019 Yamada Shunya. All rights reserved.
//

import UIKit

class SeparatorTableViewCell: UITableViewCell {
    
    // MARK: IBOutlet

    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: Properties
    
    static let reuseIdentifier = "SeparatorTableViewCell"
    static let rowHeight: CGFloat = 48
    static var nib: UINib {
        return UINib(nibName: "SeparatorTableViewCell", bundle: nil)
    }
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: UI
    
    func setupCell(title: String) {
        titleLabel.text = title
    }
    
}
