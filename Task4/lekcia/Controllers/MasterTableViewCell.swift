//
//  MasterTableViewCell.swift
//  lekcia
//
//  Created by Admin on 06.11.2020.
//

import UIKit

class MasterTableViewCell: UITableViewCell {

	@IBOutlet private weak var titleLabel: UILabel!
	@IBOutlet private weak var descriptionLabel: UILabel!


	static let identifier = String(describing: MasterTableViewCell.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	func configure(title: String, description: String) {
		titleLabel.text = title
		descriptionLabel.text = description
	}
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
