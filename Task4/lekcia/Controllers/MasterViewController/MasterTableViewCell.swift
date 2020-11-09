//
//  MasterTableViewCell.swift
//  lekcia
//
//  Created by Admin on 06.11.2020.
//

import UIKit

class MasterTableViewCell: UITableViewCell {

	
	static var reuseIdentifier: String {
		return String(describing: MasterTableViewCell.self)
	}
	var titleLabel = UILabel()
	var descriptionLabel = UILabel()
	var date = UILabel()

	static let identifier = String(describing: MasterTableViewCell.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		self.setupViewsLayout()
	}
	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	static func getEstimatedHeight() -> CGFloat {
		return 50
	}
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
	func configure(object: CellModel) {
		titleLabel.text = object.title
		descriptionLabel.text = object.description
		date.text = object.date
	}
}


private extension MasterTableViewCell {
	func setupViewsAppearances() {
		setupSuperViewAppearances()
		setupTitleLabelAppearances()
		setupDescriptionLabelAppearances()
		setupDateAppearances()
	}

	func setupSuperViewAppearances() {
		backgroundColor = .systemBackground
	}

	func setupTitleLabelAppearances() {
		titleLabel.numberOfLines = 1
		titleLabel.textAlignment = .center
		descriptionLabel.font = UIFont.boldSystemFont(ofSize: 12)
		titleLabel.text = "Заголовок"
	}

	func setupDescriptionLabelAppearances() {
		descriptionLabel.numberOfLines = 1
		descriptionLabel.textAlignment = .center
		descriptionLabel.text = "Текст текст"
	}

	func setupDateAppearances() {
		date.numberOfLines = 1
		date.textAlignment = .center
		date.font = UIFont.italicSystemFont(ofSize: 12)
		let formatter = DateFormatter()
		formatter.dateFormat = "HH:mm"
		date.text = formatter.string(from: Date.randomDate())
	}
}

// MARK: Shared Layout

private extension MasterTableViewCell {

	func setupViewsLayout() {
		setupSharedLayout()
	}

	func setupSharedLayout() {
		setupTitleLabelLabelLayout()
		setupDescriptionLabelLayout()
		setupDateLayout()
	}

	func setupTitleLabelLabelLayout() {
		addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([titleLabel.leadingAnchor.constraint(
										equalTo: safeAreaLayoutGuide.leadingAnchor,
										constant: CGFloat(Constants.bottomAndTopSpace.rawValue)),
									 titleLabel.topAnchor.constraint(
										equalTo: safeAreaLayoutGuide.topAnchor),
									 titleLabel.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7)])
	}

	func setupDescriptionLabelLayout() {
		addSubview(descriptionLabel)
		descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([descriptionLabel.leadingAnchor.constraint(
										equalTo: safeAreaLayoutGuide.leadingAnchor,
										constant: CGFloat(Constants.bottomAndTopSpace.rawValue)),
									 descriptionLabel.bottomAnchor.constraint(
										equalTo: safeAreaLayoutGuide.bottomAnchor),
									 descriptionLabel.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7)])
	}

	func setupDateLayout() {
		addSubview(date)
		date.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([date.trailingAnchor.constraint(
										equalTo: safeAreaLayoutGuide.trailingAnchor,
										constant: CGFloat(Constants.bottomAndTopSpace.rawValue)),
									 date.bottomAnchor.constraint(
										equalTo: safeAreaLayoutGuide.bottomAnchor),
									 date.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.3)])
	}

}
