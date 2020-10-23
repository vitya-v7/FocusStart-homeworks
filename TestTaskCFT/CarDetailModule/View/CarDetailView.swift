//
//  CarDetailView.swift
//  TestTaskCFT
//
//  Created by Viktor D. on 18.09.2020.
//  Copyright © 2020 Viktor D. All rights reserved.
//

import UIKit

protocol CarDetailViewInput : UIViewController  {
    func setInitialState()
    func setViewModel(viewModel: CarDetailViewModel)
}

protocol CarDetailViewOutput {
    func callPopover(fromView: UIView, option: String)
	func changeSelectedDataInView(type: PickerType, index: Int)
	func saveSelectedTextFieldValue(type: PickerType, value: String)
    func viewDidLoadDone()
    func saveCarInDB()
	func reloadData()
}

class CarDetailView: UIViewController, CarDetailViewInput, UITextFieldDelegate {
    
    var output: CarDetailViewOutput?
    var viewModel: CarDetailViewModel?
    
    @IBOutlet weak var carModel: UITextField!
    @IBOutlet weak var carYear: UITextField!
    @IBOutlet weak var carCountry: UITextField!
    @IBOutlet weak var carBodyStyle: UITextField!
	@IBOutlet weak var carNumberLabel: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
		carNumberLabel.text = "312"
        output?.viewDidLoadDone()
    }
    
    @objc func saveCar(_ sender: Any) {
		output?.saveSelectedTextFieldValue(type: .carNumber, value: carNumberLabel.text!)
		if ((Int(carYear.text!)) != nil) ||
			(carYear.text!.trimmingCharacters(in: .whitespaces).isEmpty)  {
			output?.saveSelectedTextFieldValue(type: .carYear, value: carYear.text!)
		}
        output?.saveCarInDB()
    }
    
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
       
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
		if output != nil && textField.tag != 3 && textField.tag != 6 {
            output?.callPopover(fromView: textField, option: textField.text!)
            return false
        }
        return true
    }

    private func configureDetailView(withObject object: CarDetailViewModel) {
        self.carModel!.text = object.carModel
        self.carCountry!.text = object.carCountry
        self.carBodyStyle!.text = object.carBodyStyle
		self.carNumberLabel.text = object.carNumber
		self.carYear.text = object.carYear
    }
}

