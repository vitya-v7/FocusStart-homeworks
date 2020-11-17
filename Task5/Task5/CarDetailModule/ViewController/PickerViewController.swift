//
//  PickerView.swift
//  Task5
//
//  Created by Admin on 19.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
enum PickerType: String {
	case carModel
	case carCountry
	case carBodyStyle
	case carYear
	case carNumber
}

class PickerViewController: UIViewController {

	@IBOutlet weak var picker: UIPickerView!
	@IBOutlet weak var button: UIButton!
	var type: PickerType?
	var options: [String]?
	var carID: Int?
	var currentOption: String?
	var selectedIndexInPicker: Int?
	var output: ICarDetailViewOutput?
	var outputList: ICarsListViewOutput?
	private func selectedOption() -> [String] {
		var itemArray = [String]()
		switch type {
		case .carModel:
			for item in CarService.CarModels.allCases {
				itemArray.append(item.rawValue)
			}
		case .carBodyStyle:
			for item in CarService.CarBodyStyle.allCases {
				itemArray.append(item.rawValue)
			}
		case .carCountry:
			for item in CarService.CarCountry.allCases {
				itemArray.append(item.rawValue)
			}
		default:
			return [String]()
		}
		return itemArray
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		picker.delegate = self
		options = selectedOption()
		if outputList != nil {
			options?.insert("All bodystyles", at: 0)
		}
		button?.addTarget(self, action: #selector(saveData(_:)), for: .touchUpInside)
		picker?.selectRow(0, inComponent: 0, animated: true)
		guard let options = options  else {
			return
		}
		var selectedIndexInPicker = 0
		if currentOption != nil {
			for i in 0 ..< options.count {
				if currentOption == options[i] {
					selectedIndexInPicker = i
				}
			}
		}
		if output != nil {
			picker?.selectRow(selectedIndexInPicker, inComponent: 0, animated: true)
		}
		else {
			if selectedIndexInPicker > 0 {
				picker?.selectRow(selectedIndexInPicker + 1, inComponent: 0, animated: true)
			}
		}
	}

	@objc func saveData(_ but: UIButton) {
		let row = picker?.selectedRow(inComponent: 0)
		if let row = row, let out = output, let type = type {
			out.changeSelectedDataInView(type: type, index: row)
		}
		if let outputList = outputList {
			guard let options = options, let row = row else {
				return
			}
			if row > 0 {
				outputList.filterCars(bodyStyle: CarService.CarBodyStyle(rawValue: options[row]))
			}
			else {
				outputList.filterCars(bodyStyle: nil)
			}
		}
		self.dismiss(animated: true, completion: nil)
	}
}

extension PickerViewController: UIPickerViewDelegate
{
	func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
		var label = view as? UILabel
		if label == nil {
			label = UILabel()
		}
		label?.text = options?[row]
		label?.adjustsFontSizeToFitWidth = true
		label?.textAlignment = .center
		guard let returnLabel = label else {
			return UILabel()
		}
		return returnLabel
	}
}

extension PickerViewController: UIPickerViewDataSource
{
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return options?.count ?? 0
	}

	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
}
