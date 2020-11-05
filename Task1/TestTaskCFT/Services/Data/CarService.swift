//
//  CarService.swift
//  TestTaskCFT
//
//  Created by Viktor D. on 16.09.2020.
//  Copyright © 2020 Viktor D. All rights reserved.
//

import UIKit

protocol ICarsListServiceInterface {
	func getCars() -> [CarModel]?
	func deleteCar(key: String)
}

protocol IDetailsCarServiceInterface {
	func getCar(key: String) -> CarModel?
	func addCar(car: CarModel)
	func updateCar(car: CarModel)
}

class CarService {
	enum CarBodyStyle: String, CaseIterable, Codable   {
		case Sedan
		case Universal
		case Coupe
		case Hatchback
	}

	enum CarCountry: String, CaseIterable, Codable  {
		case Germany
		case Japan
		case Russia
		case USA
	}

	enum CarModels: String, CaseIterable, Codable   {
		case Toyota
		case Mazda
		case Nissan
		case Wolkswagen
		case BMW
	}
}

extension CarService: ICarsListServiceInterface
{
	func getCars() -> [CarModel]? {
		let allValues: Data? = UserDefaults.standard.data(forKey: "cars")
		if let cars = allValues {
			let decodedCars = try! JSONDecoder().decode([CarModel].self, from: cars)
			return decodedCars
		}
		else {
			return [CarModel]()
		}
	}

	func deleteCar(key: String) {
		let cars = getCars()
		guard var carsIn = cars else {
			return
		}
		for index in 0 ..< carsIn.count {
			if carsIn[index].carKey == key {
				carsIn.remove(at: index)
				break
			}
		}
		setCars(cars: carsIn)
	}
}

extension CarService: IDetailsCarServiceInterface
{
	func updateCar(car: CarModel) {
		let cars = getCars()
		guard var carsIn = cars else {
			return
		}
		for index in 0 ..< carsIn.count {
			if carsIn[index].carKey == car.carKey {
				carsIn[index] = car
				break
			}
		}
		setCars(cars: carsIn)
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
		let cars = getCars()
		for car in cars! {
			if car.carKey == key {
				return car
			}
		}
		return nil
	}
}

private extension CarService {
	func setCars(cars: [CarModel]) {
		let encodedData =  try! JSONEncoder().encode(cars)
		UserDefaults.standard.set(encodedData, forKey: "cars")
		UserDefaults.standard.synchronize()
	}
}
