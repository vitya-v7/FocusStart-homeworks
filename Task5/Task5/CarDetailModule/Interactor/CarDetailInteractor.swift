//
//  CarsDetailInteractor.swift
//  Task5
//
//  Created by Admin on 16.11.2020.
//  Copyright © 2020 Admin. All rights reserved.
//



class CarDetailInteractor: ICarDetailPresenterInput {
	var carService: IDetailsCarServiceInterface?
	func getCar(key: String) -> CarModel? {
		return carService?.getCar(key: key)
	}

	func addCar(car: CarModel) {
		carService?.addCar(car: car)
	}

	func updateCar(car: CarModel) {
		carService?.updateCar(car: car)
	}
}
