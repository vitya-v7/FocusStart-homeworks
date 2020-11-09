//
//  MasterTableViewCell.swift
//  lekcia
//
//  Created by Admin on 06.11.2020.
//

import UIKit

class MasterTableViewCell: UITableViewCell {

	var titleLabel = UILabel()
	var descriptionLabel = UILabel()
	var date = UILabel()

	static let identifier = String(describing: MasterTableViewCell.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	func configure(object: CellModel ) {
		titleLabel.text = object.title
		descriptionLabel.text = object.description
		date.text = object.date
	}
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
