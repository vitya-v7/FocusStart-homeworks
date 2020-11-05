//
//  CarDetailViewModel.swift
//  TestTaskCFT
//
//  Created by Viktor D. on 18.09.2020.
//  Copyright © 2020 Viktor D. All rights reserved.
//

import UIKit

struct CarDetailViewModel {

	var carModel: String?
	var carYear: String?
	var carCountry: String?
	var carBodyStyle: String?
	var carNumber: String?

	init (withElementModel model: CarModel) {
		self.carModel = model.model.rawValue
		self.carCountry = model.manufacturer.rawValue
		self.carBodyStyle = model.body.rawValue
		if let number = model.carNumber {
			self.carNumber = String(number)
		}
		else {
			self.carNumber = nil
		}
		if let year = model.yearOfIssue {
			self.carYear = String(year)
		}
		else {
			self.carYear = nil
		}
	}
}
