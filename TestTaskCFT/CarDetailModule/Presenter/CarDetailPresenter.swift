//
//  CarDetailPresenter.swift
//  TestTaskCFT
//
//  Created by Viktor D. on 18.09.2020.
//  Copyright © 2020 Viktor D. All rights reserved.
//

import UIKit

class CarDetailPresenter: CarDetailViewOutput {
    
    var key: String?
    var carService: DetailsCarServiceInterface?
    var view: CarDetailViewInput?
    var carModel: CarModel?
    
    func viewDidLoadDone() {
        view?.setInitialState()
        if key != nil {
            carModel = carService?.getCar(key: key!)
        }
        else {
			carModel = CarModel.init(model: CarService.CarModels.allCases[0], manufacturer: CarService.CarCountry.allCases[0], body: CarService.CarBodyStyle.allCases[0], carKey: nil)
        }
        reloadData()
    }
    
    func saveCarInDB() {
        if carModel!.carKey == nil {
            carService?.addCar(car: carModel!)
        }
        else {
            carService?.updateCar(car: carModel!)
        }
        self.view?.navigationController?.popViewController(animated: true)
    }
    
    func callPopover(fromView view: UIView, option: String) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let pv = storyboard.instantiateViewController(withIdentifier: "PickerViewIdentifier") as! PickerView
        pv.output = self
        pv.currentOption = option
        switch view.tag {
            case 1:
                pv.type = .carModel
            case 2:
                pv.type = .carBodyStyle
            case 4:
                pv.type = .carCountry
			default:
				pv.type = .carYear
        }
        
        pv.modalPresentationStyle = UIModalPresentationStyle.popover
               pv.preferredContentSize = CGSize(width: 300, height: 300)
        pv.picker?.backgroundColor = UIColor.white
        pv.output = self
        self.view?.present(pv, animated: true, completion: nil)
        let popover = pv.popoverPresentationController
        popover?.permittedArrowDirections = .any
        popover?.sourceView = view
        popover?.sourceRect = (view.bounds)
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
		reloadData()
	}

    func reloadData() {
        view!.setViewModel(viewModel: CarDetailViewModel.init(withElementModel: carModel!))
    }
    
    func convertCarModelToViewModel(car: CarModel) -> CarDetailViewModel {
        let viewModel = CarDetailViewModel(withElementModel: car)
        return viewModel
    }
}
