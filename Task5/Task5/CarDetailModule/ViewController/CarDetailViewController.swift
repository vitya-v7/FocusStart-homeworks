//
//  CarDetailViewController.swift
//  Task5
//
//  Created by Viktor D. on 18.09.2020.
//  Copyright © 2020 Viktor D. All rights reserved.
//

import UIKit

protocol ICarDetailViewInput : UIViewController  {
	func setInitialState()
	func setViewModel(viewModel: CarDetailViewModel)
}


class CarDetailViewController: UIViewController {

	var output: CarDetailPresenter?
	var viewModel: CarDetailViewModel?
	var key: String?
	var year = ""
	var number = ""
	enum textFieldsWithTags: Int {
		case carModel = 1
		case carBodyStyle
		case carYear
		case carCountry
		case carNumber
	}

	@IBOutlet weak var carModel: UITextField!
	@IBOutlet weak var carYear: UITextField!
	@IBOutlet weak var carCountry: UITextField!
	@IBOutlet weak var carBodyStyle: UITextField!
	@IBOutlet weak var carNumberLabel: UITextField!

	override func viewDidLoad() {
		super.viewDidLoad()
		setInitialState()
		output?.viewDidLoadDone()
		
		let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
		view.addGestureRecognizer(tap)
	}

	@objc func dismissKeyboard() {
		view.endEditing(true)
	}

	@objc func saveCar(_ sender: Any) {
		output?.saveSelectedTextFieldValue(type: .carNumber, value: carNumberLabel.text ?? "")
		guard let carYearLabel = carYear.text else {
			return
		}
		if ((Int(carYearLabel)) != nil) ||
			(carYearLabel.trimmingCharacters(in: .whitespaces).isEmpty)  {
			output?.saveSelectedTextFieldValue(type: .carYear, value: carYearLabel)
		}
		output?.reloadData()
		output?.saveCarInDB()
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		if (self.isMovingFromParent) {
			SceneDelegate.coordinatingController.back(animated: true)
		}
	}
}

extension CarDetailViewController: UITextFieldDelegate
{
	func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
		if output != nil && textField.tag != textFieldsWithTags.carYear.rawValue && textField.tag != textFieldsWithTags.carNumber.rawValue {
			var pickerType: PickerType?
			switch textField.tag {
			case 1:
				pickerType = .carModel
			case 2:
				pickerType = .carBodyStyle
			case 4:
				pickerType = .carCountry
			default:
				pickerType = .carBodyStyle
			}
			output?.carModel?.carNumber = carNumberLabel.text
			output?.carModel?.yearOfIssue = Int(carYear.text!)
			
			output?.callPopover(pickerType: pickerType!, option: textField.text!)
			return false
		}
		return true
	}
}

extension CarDetailViewController: ICarDetailViewInput
{
	func setInitialState() {
		let rightButton = UIBarButtonItem.init(barButtonSystemItem: .save, target: self, action: #selector(saveCar(_:)))
		self.navigationItem.rightBarButtonItem = rightButton
		carModel.delegate = self
		carCountry.delegate = self
		carBodyStyle.delegate = self
		carYear.delegate = self
		carNumberLabel.delegate = self
	}

	func setViewModel(viewModel: CarDetailViewModel) {
		self.viewModel = viewModel
		self.configureDetailView(withObject: viewModel)
	}
}

extension CarDetailViewController: INavigationSeed
{
	var vc: UIViewController { self }
	func set<Parameters>(type: TypeOfParameters, parameters: Parameters?) {
		if type == .forDetailController {
			if let parameters = parameters {
				output?.setKey(key: parameters as? String)
			}
			else {
				output?.setKey(key: nil)
			}
			output?.viewDidLoadDone()
		}
	}
}

private extension CarDetailViewController
{
	func configureDetailView(withObject object: CarDetailViewModel) {
		if let _ = self.carModel,
		   let _ = self.carCountry,
		   let _ = self.carBodyStyle,
		   let _ = self.carNumberLabel,
		   let _ = self.carYear {
			self.carModel.text = object.carModel
			self.carCountry.text = object.carCountry
			self.carBodyStyle.text = object.carBodyStyle
			self.carNumberLabel.text = object.carNumber
			self.carYear.text = object.carYear
		}
	}
}



