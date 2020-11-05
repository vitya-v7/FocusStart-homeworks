//
//  CarsElementCell.swift
//  TestTaskCFT
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
	
	func configureCell(withObject object: CarsElementViewModel) {
		viewModel = object
		self.carModel.text = "Model: " + object.carModel!
		self.carBodyStyle.text = "Body Style: " + object.carBodyStyle!
		self.carCountry.text = "Country: " + object.carCountry!
		
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
	
	override func prepareForReuse() {
		self.carModel.text = nil
		self.carYear.text = nil
		self.carBodyStyle.text = nil
		self.carCountry.text = nil
		self.carNumber.text = nil
	}
}
