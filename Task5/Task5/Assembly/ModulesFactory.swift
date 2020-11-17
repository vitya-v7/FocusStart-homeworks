//
//  ModulesFactory.swift
//  Task5
//
//  Created by Admin on 17.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class ModulesFactory {
	class func createCarsListModule() -> UIViewController {
		let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
		let view = storyboard.instantiateViewController(identifier: "CarsListViewIdentifier") as! CarsListViewController
		let carService = CarService.init()
		let presenter = CarsListPresenter()
		let interactor = CarsListInteractor()
		interactor.carService = carService
		presenter.interactor = interactor
		view.output = presenter
		presenter.view = view
		return view
	}
	
	class func createCarDetailModule(key: String?) -> UIViewController {
		let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
		let view = storyboard.instantiateViewController(identifier: "CarDetailViewIdentifier") as! CarDetailViewController
		let carService = CarService.init()
		let presenter = CarDetailPresenter()
		let interactor = CarDetailInteractor()
		interactor.carService = carService
		presenter.interactor = interactor
		view.output = presenter
		presenter.view = view
		presenter.key = key
		return view
	}
}
