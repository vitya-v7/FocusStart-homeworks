//
//  CarDetailPresenter.swift
//  Task5
//
//  Created by Viktor D. on 18.09.2020.
//  Copyright © 2020 Viktor D. All rights reserved.
//

import UIKit
protocol ICarDetailPresenterInput {
	func getCar(key: String) -> CarModel?
	func addCar(car: CarModel)
	func updateCar(car: CarModel)
}
class CarDetailPresenter {
	var key: String?
	var interactor: ICarDetailPresenterInput?
	var view: ICarDetailViewInput?
	var carModel: CarModel?
	var router: IRouterDetailToPopover?
	func convertCarModelToViewModel(car: CarModel) -> CarDetailViewModel {
		let viewModel = CarDetailViewModel(withElementModel: car)
		return viewModel
	}

	func setKey(key: String) {
		self.key = key
	}
}

extension CarDetailPresenter: ICarDetailViewOutput
{

	func callPopover(pickerType: PickerType, option: String) {
		router?.nextPopoverModule(pickerType: pickerType, choice: option)
	}
	
	func changeSelectedDataInView(type: PickerType, index: Int) {
		switch type {
		case .carModel:
			carModel?.model = CarService.CarModels.allCases[index]
		case .carBodyStyle:
			carModel?.body = CarService.CarBodyStyle.allCases[index]
		case .carCountry:
			carModel?.manufacturer = CarService.CarCountry.allCases[index]
		default: print("unknown option")
		}
		reloadData()
	}
	
	func viewDidLoadDone() {
		if let key = key {
			carModel = interactor?.getCar(key: key)
		}
		else {
			carModel = CarModel.init(model: CarService.CarModels.allCases[0], manufacturer: CarService.CarCountry.allCases[0], body: CarService.CarBodyStyle.allCases[0], carKey: nil)
		}
		reloadData()
	}
	
	func saveCarInDB() {
		if let carModel = carModel, carModel.carKey == nil {
			interactor?.addCar(car: carModel)
		}
		if let carModel = carModel, carModel.carKey != nil {
			interactor?.updateCar(car: carModel)
		}
		self.view?.navigationController?.popViewController(animated: true)
	}
	
	func saveSelectedTextFieldValue(type: PickerType, value: String) {
		switch type {
		case .carYear:
			if value.trimmingCharacters(in: .whitespaces).isEmpty {
				carModel?.yearOfIssue = nil
			}
			else {
				carModel?.yearOfIssue = Int(value)
			}
		case .carNumber:
			if value.trimmingCharacters(in: .whitespaces).isEmpty {
				carModel?.carNumber = nil
			}
			else {
				carModel?.carNumber = value
			}
		default: print("unknown option")
		}
	}
	
	func reloadData() {
		guard let carModel = carModel else {
			return
		}
		view?.setViewModel(viewModel: CarDetailViewModel.init(withElementModel: carModel))
	}
}
