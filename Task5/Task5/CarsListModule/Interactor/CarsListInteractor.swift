//
//  CarsListInteractor.swift
//  Task5
//
//  Created by Admin on 16.11.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

class CarsListInteractor: ICarListInteractorInput {
	weak var presenter: CarsListPresenter?
	var carService: ICarsListService?
	
	func getCars() -> [CarModel]? {
		carService?.getCars()
	}

	func deleteCar(key: String) {
		carService?.deleteCar(key: key)
	}
}
