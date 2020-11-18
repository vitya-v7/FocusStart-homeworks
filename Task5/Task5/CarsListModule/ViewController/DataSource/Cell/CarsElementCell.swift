//
//  CarsElementCell.swift
//  Task5
//
//  Created by Viktor D. on 17.09.2020.
//  Copyright © 2020 Viktor D. All rights reserved.
//

import UIKit


class CarsElementCell: UITableViewCell {

	var viewModel: CarsElementViewModel?

	@IBOutlet weak var carModel: UILabel!
	@IBOutlet weak var carYear: UILabel!
	@IBOutlet weak var carCountry: UILabel!
	@IBOutlet weak var carBodyStyle: UILabel!
	@IBOutlet weak var carNumber: UILabel!
	
	
	static let reuseIdentifier = "CarsListCellIdentifier"
	


	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 100
	}
	
	override func prepareForReuse() {
		self.carModel.text = nil
		self.carYear.text = nil
		self.carBodyStyle.text = nil
		self.carCountry.text = nil
		self.carNumber.text = nil
	}

	func configureCell(withObject object: CarsElementViewModel?) {
		viewModel = object

		guard let object = object, let carModel = object.carModel, let carBodyStyle = object.carBodyStyle, let carCountry = object.carCountry else {
			return
		}
		self.carModel.text = "Model: " + carModel
		self.carBodyStyle.text = "Body Style: " + carBodyStyle
		self.carCountry.text = "Country: " + carCountry
		if let year = object.carYear {
			self.carYear.text = "Year: " + year
		}
		else {
			self.carYear.text = "Year: -"
		}
		if let number = object.carNumber {
			self.carNumber.text = "Car number: " + number
		}
	}
}
