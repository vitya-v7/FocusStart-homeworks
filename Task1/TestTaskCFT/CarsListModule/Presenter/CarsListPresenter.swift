//
//  CarsListPresenter.swift
//  TestTask
//
//  Created by Viktor D. on 16.09.2020.
//  Copyright © 2020 Viktor D. All rights reserved.
//

import UIKit
protocol ICarListPresenterInput {
	func getCars() -> [CarModel]
	func deleteCar(key: String)
}
class CarsListPresenter {
	var ICarDetailPresenterInput: ICarListPresenterInput
	var view: ICarsListViewInput?
	var carModels: [CarModel]?
	var filterBodyStyle: CarService.CarBodyStyle?
	
	func viewDidLoadDone() {
		view?.setInitialState()
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
	
	func callPopover(fromView view: UIView, option: String?) {
		let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
		let pv = storyboard.instantiateViewController(withIdentifier: "PickerViewIdentifier") as! PickerViewController
		pv.outputList = self
		pv.currentOption = option
		pv.type = .carBodyStyle
		pv.modalPresentationStyle = UIModalPresentationStyle.popover
		pv.preferredContentSize = CGSize(width: 300, height: 300)
		pv.picker?.backgroundColor = UIColor.white
		self.view?.present(pv, animated: true, completion: nil)
		let popover = pv.popoverPresentationController
		popover?.permittedArrowDirections = .any
		popover?.sourceView = view
		popover?.sourceRect = (view.bounds)
	}
	
	func cellWithIndexSelected(row: Int) {
		guard let carModelKey = carModels?[row].carKey else {
			return
		}
		self.view?.navigationController?.pushViewController(ModulesFactory.createCarDetailModule(key: carModelKey), animated: true)
	}
	
	func plusButtonClicked() {
		self.view?.navigationController?.pushViewController(ModulesFactory.createCarDetailModule(key: nil), animated: true)
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
