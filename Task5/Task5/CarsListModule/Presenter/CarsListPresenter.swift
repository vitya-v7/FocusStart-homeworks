//
//  CarsListPresenter.swift
//  TestTask
//
//  Created by Viktor D. on 16.09.2020.
//  Copyright © 2020 Viktor D. All rights reserved.
//

import UIKit

protocol ICarListInteractorInput {
	func getCars() -> [CarModel]?
	func deleteCar(key: String)
}

class CarsListPresenter {
	var interactor: ICarListInteractorInput?
	weak var view: ICarsListViewInput?
	var router: IRouterListToDetail?
	var routerToPopover: IRouterListToPopover?
	var carModels: [CarModel]?
	var filterBodyStyle: CarService.CarBodyStyle?

	func viewDidLoadDone() {
		view?.setInitialState()
	}

	func routeToDetailModule(indexPath: IndexPath) {
		router?.nextDetailModule(carKey: carModels![indexPath.row].carKey!)
	}

	func plusButtonClicked() {
		router?.nextDetailModule(carKey: nil)
	}

	func viewWillAppearDone() {
		self.reloadData()
		if filterBodyStyle != nil {
			filterCars(bodyStyle: filterBodyStyle)
		}
	}
}

extension CarsListPresenter: ICarsListViewOutput
{
	func cellSelectedAt(indexPath: IndexPath) {
		router?.nextDetailModule(carKey: carModels![indexPath.row].carKey )
	}

	func convertCarModelToViewModel(car: CarModel) -> CarsElementViewModel {
		let viewModel = CarsElementViewModel(withElementModel: car)
		return viewModel
	}
	
	func convertModelsToViewModels(models: [CarModel]) -> [CarsElementViewModel] {
		var carCells = [CarsElementViewModel]()
		
		for car in models {
			carCells.append(CarsElementViewModel.init(withElementModel: car))
		}
		return carCells
	}
	
	func filterCars(bodyStyle: CarService.CarBodyStyle?) {
		filterBodyStyle = bodyStyle
		var carModelsFiltered = [CarModel]()
		var carModels = interactor?.getCars() ?? [CarModel]()

		if let bodyStyle = bodyStyle {
			for item in carModels {
				if item.body == bodyStyle {
					carModelsFiltered.append(item)
				}
			}
			carModels = carModelsFiltered
			view?.setViewModels(viewModels: convertModelsToViewModels(models: carModelsFiltered))
		}
		else {
			view?.setViewModels(viewModels: convertModelsToViewModels(models: carModels))
		}
	}
	
	func callPopover() {
		routerToPopover?.nextPopoverModule()
	}

	func reloadData() {
		carModels = interactor?.getCars()
		if let carModels = carModels {
			view?.setViewModels(viewModels: convertModelsToViewModels(models: carModels))
		}
	}
	
	func deleteButtonPressedWithIndexRow(row: Int) {
		if let carKey = carModels?[row].carKey {
			interactor?.deleteCar(key: carKey)
			reloadData()
		}
	}
}
