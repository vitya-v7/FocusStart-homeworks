//
//  MainCell.swift
//  Task4
//
//  Created by Admin on 10.11.2020.
//

import UIKit

class MainCell: UITableViewCell {

	var titleLabel = UILabel()
	var descriptionLabel = UILabel()
	var date = UILabel()

	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		selectedBackgroundView = UIView()
		selectedBackgroundView!.backgroundColor = UIColor.systemGreen
	}
	
	static func getEstimatedHeight() -> CGFloat {
		return Constants.estimatedCellHeight
	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}

	func configure(object: CellModel) {
		titleLabel.text = object.title
		descriptionLabel.text = object.description
		let formatter = DateFormatter()
		formatter.dateFormat = "HH:mm"
		date.text = formatter.string(from: object.date ?? Date.init(timeIntervalSinceNow: TimeInterval.init(10)))
	}
}
