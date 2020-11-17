//
//  FlowController.swift
//  Task5
//
//  Created by Admin on 16.11.2020.
//  Copyright © 2020 Admin. All rights reserved.
//
import Foundation
import UIKit

final class FlowController
{
	var firstVC: INavigationSeed?
	private var coordinatingController: CoordinatingController
	private var modules = [INavigationSeed]()
	init(coordinatingController: CoordinatingController) {
		self.coordinatingController = coordinatingController
		createCarsListModule()
		createCarDetailModule()
	}
	func createCarsListModule() -> INavigationSeed {


		let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
		let view = storyboard.instantiateViewController(identifier: "CarsListViewIdentifier") as! CarsListViewController
		let carService = CarService.init()
		let presenter = CarsListPresenter()
		let interactor = CarsListInteractor()
		interactor.carService = carService
		presenter.interactor = interactor
		view.output = presenter
		presenter.view = view
		let router = RouterListToDetail()
		presenter.router = router
		self.coordinatingController.registerFirst(module: .first, seed: view)
		self.modules.append(self.createCarDetailModule())
		return view

	}

	func createCarDetailModule() -> INavigationSeed {
		let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
		let view = storyboard.instantiateViewController(identifier: "CarDetailViewIdentifier") as! CarDetailViewController
		let carService = CarService.init()
		let presenter = CarDetailPresenter()
		let interactor = CarDetailInteractor()
		interactor.carService = carService
		presenter.interactor = interactor
		view.output = presenter
		presenter.view = view
		self.coordinatingController.register(module: .second, seed: view)
		return view
	}
}
