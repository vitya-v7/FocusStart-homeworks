//
//  CarsListInteractor.swift
//  Task5
//
//  Created by Admin on 16.11.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

protocol ICarListInteractorInput {
	func getCars() -> [CarModel]?
	func deleteCar(key: String)
}

class CarsListInteractor: ICarListInteractorInput {
	var carService: ICarsListService?
	
	func getCars() -> [CarModel]? {
		carService?.getCars()
	}

	func deleteCar(key: String) {
		carService?.deleteCar(key: key)
	}
}
