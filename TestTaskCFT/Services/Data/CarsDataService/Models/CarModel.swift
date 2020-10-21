//
//  CarModel.swift
//  TestTaskCFT
//
//  Created by Viktor D. on 16.09.2020.
//  Copyright © 2020 Viktor D. All rights reserved.
//

import UIKit

struct CarModel: Codable {
	var carModel: CarService.CarModels?
	var carCountry: CarService.CarCountry?
    var carYear: Int?
	var carBodyStyle: CarService.CarBodyStyle?
    var carKey: String?
}
