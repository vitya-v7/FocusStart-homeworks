//
//  CarService.swift
//  TestTaskCFT
//
//  Created by Viktor D. on 16.09.2020.
//  Copyright © 2020 Viktor D. All rights reserved.
//

import UIKit

protocol CarsListServiceInterface {
    func getCars() -> [CarModel]?
    func deleteCar(key: String)
}

protocol DetailsCarServiceInterface {
    func getCar(key: String) -> CarModel?
    func addCar(car: CarModel)
    func updateCar(car: CarModel)
}



class CarService: CarsListServiceInterface, DetailsCarServiceInterface {
    
	enum CarBodyStyle: String, CaseIterable, Codable   {
		case Sedan = "Sedan"
		case Universal = "Universal"
		case Coupe = "Coupe"
		case Hatchback = "Hatchback"
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
	
    static var carYear:[Int] = Array(2000...2014)
    
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
    
    func updateCar(car: CarModel) {
        var cars = getCars()
        for index in 0 ..< cars!.count {
            if cars![index].carKey == car.carKey {
                cars![index] = car
                break
            }
        }
        setCars(cars: cars!)
    }
    
    private func setCars(cars: [CarModel]) {
        let encodedData =  try! JSONEncoder().encode(cars)
        UserDefaults.standard.set(encodedData, forKey: "cars")
        UserDefaults.standard.synchronize()
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
    
    func deleteCar(key: String) {
        var cars = getCars()
        for index in 0 ..< cars!.count {
            if cars![index].carKey == key {
                cars!.remove(at: index)
                break
            }
        }
        setCars(cars: cars!)

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

