//
//  CarModel.swift
//  Task5
//
//  Created by Viktor D. on 16.09.2020.
//  Copyright © 2020 Viktor D. All rights reserved.
//

import UIKit

struct CarModel: Codable {
	var model: CarService.CarModels
	var manufacturer: CarService.CarCountry
	var yearOfIssue: Int?
	var body: CarService.CarBodyStyle
	var carNumber: String?
	var carKey: String?
}
