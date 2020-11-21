//
//  PickerView.swift
//  Task5
//
//  Created by Admin on 19.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

protocol PopoverOutput {
	func changeData(type: PickerType, index: Int)
}

class PickerViewController: UIViewController {

	@IBOutlet weak var picker: UIPickerView!
	@IBOutlet weak var button: UIButton!
	var type: PickerType?
	var moduleType: ModuleType?
	var options: [String]?
	var currentOption: Int?
	var output: PopoverOutput?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		picker.delegate = self
		button?.addTarget(self, action: #selector(saveData(_:)), for: .touchUpInside)
		picker?.selectRow(0, inComponent: 0, animated: true)
	}
	
	func updatePicker() {
		if moduleType == .listModule {
			options?.insert("All bodystyles", at: 0)
			picker?.selectRow(0, inComponent: 0, animated: true)
		}
		if moduleType == .detailModule  {
			picker?.selectRow(currentOption!, inComponent: 0, animated: true)
		}
		self.picker.reloadAllComponents()
	}

	@objc func saveData(_ but: UIButton) {
		let row = picker?.selectedRow(inComponent: 0)
		if let row = row, let out = output, let type = type {
			if moduleType == .detailModule {
				out.changeData(type: type, index: row)
			}
			if moduleType == .listModule  {
				let rowIn = row - 1
				out.changeData(type: type, index: rowIn)
			}
		}
		SceneDelegate.coordinatingController.back(animated: true)
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

extension PickerViewController: INavigationSeed
{
	var vc: UIViewController { self }
	func set<Parameters>(type typeOfParameters: TypeOfParameters, parameters: Parameters) {
		if typeOfParameters == .forPopover {
			let parametersIn = parameters as! ParametersStruct
			type = parametersIn.pickerType
			currentOption = parametersIn.currentChoice ?? 0
			output = parametersIn.output
			options = parametersIn.options
			moduleType = parametersIn.moduleType
			updatePicker()
		}
	}
}
