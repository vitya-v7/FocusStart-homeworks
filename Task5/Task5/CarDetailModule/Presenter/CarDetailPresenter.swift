//
//  CarDetailPresenter.swift
//  Task5
//
//  Created by Viktor D. on 18.09.2020.
//  Copyright © 2020 Viktor D. All rights reserved.
//

import UIKit

class CarDetailPresenter {
	var key: String?
	var interactor: ICarDetailInteractorInput?
	var view: ICarDetailViewInput?
	var carModel: CarModel?
	var router: IRouterDetailToPopoverInput?
}

extension CarDetailPresenter: ICarDetailViewOutput {

	func setCarNumber(carNumber: String?) {
		carModel?.carNumber = carNumber
	}

	func setCarYear(year: Int?) {
		carModel?.yearOfIssue = year
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
	func setKey(key: String?) {
		self.key = key
	}

	func callPopover(pickerType: PickerType, option: Int) {
		var itemArray = [String]()
		switch pickerType {
		case .carModel:
			for item in CarModels.allCases {
				itemArray.append(item.rawValue)
			}
		case .carBodyStyle:
			for item in CarBodyStyle.allCases {
				itemArray.append(item.rawValue)
			}
		case .carCountry:
			for item in CarCountry.allCases {
				itemArray.append(item.rawValue)
			}
		default:
			print("error: callPopover")
		}

		router?.nextPopoverModule(pickerType: pickerType, currentChoice: option, options: itemArray)
	}

	func changeSelectedDataInView(type: PickerType, index: Int) {
		switch type {
		case .carModel:
			carModel?.model = CarModels.allCases[index]
		case .carBodyStyle:
			carModel?.body = CarBodyStyle.allCases[index]
		case .carCountry:
			carModel?.manufacturer = CarCountry.allCases[index]
		default: print("unknown option")
		}
		reloadData()
	}

	func convertCarModelToViewModel(car: CarModel) -> CarDetailViewModel {
		let viewModel = CarDetailViewModel(withElementModel: car)
		return viewModel
	}

	func viewDidLoadDone() {
		if let key = key {
			carModel = interactor?.getCar(key: key)
		}
		else {
			carModel = CarModel.init(model: CarModels.allCases[0], manufacturer: CarCountry.allCases[0], body: CarBodyStyle.allCases[0], carKey: nil)
		}
		reloadData()
	}
}

extension CarDetailPresenter: PopoverOutput {
	func changeData(type: PickerType, index: Int) {
		changeSelectedDataInView(type: type, index: index)
	}
}
