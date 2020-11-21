//
//  swift
//  Task5
//
//  Created by Viktor D. on 16.09.2020.
//  Copyright © 2020 Viktor D. All rights reserved.
//

import UIKit

protocol ICarsListService {
	func getCars() -> [CarModel]?
	func deleteCar(key: String)
}

protocol IDetailsCarService {
	func getCar(key: String) -> CarModel?
	func addCar(car: CarModel)
	func updateCar(car: CarModel)
}

class CarService {
	init() {}
}

extension CarService: ICarsListService
{
	func getCars() -> [CarModel]? {
		let allValues: Data? = UserDefaults.standard.data(forKey: "cars")
		if let cars = allValues {
			let decoded = try? JSONDecoder().decode([CarModel].self, from: cars)
			guard let decodedCars = decoded else {
				return nil
			}
			return decodedCars
		}
		else {
			return [CarModel]()
		}
	}
	
	func deleteCar(key: String) {
		var cars = getCars() ?? [CarModel]()
		for index in 0 ..< cars.count {
			if cars[index].carKey == key {
				cars.remove(at: index)
				break
			}
		}
		setCars(cars: cars)
	}
}

extension CarService: IDetailsCarService
{
	func updateCar(car: CarModel) {
		var cars = getCars() ?? [CarModel]()
		for index in 0 ..< cars.count {
			if cars[index].carKey == car.carKey {
				cars[index] = car
				break
			}
		}
		setCars(cars: cars)
	}
	
	func addCar(car: CarModel) {
		let cars = getCars()
		if var carArray = cars {
			var carCopy = car
			carCopy.carKey = UUID().uuidString
			carArray.append(carCopy);
			setCars(cars: carArray)
		}
	}
	
	func getCar(key: String) -> CarModel? {
		let cars = getCars() ?? [CarModel]()
		for car in cars {
			if car.carKey == key {
				return car
			}
		}
		return nil
	}
}

private extension CarService
{
	func setCars(cars: [CarModel]) {
		let encoded = try? JSONEncoder().encode(cars)
		guard let encodedData = encoded else {
			return
		}
		UserDefaults.standard.set(encodedData, forKey: "cars")
		UserDefaults.standard.synchronize()
	}
}
