//
//  PickerView.swift
//  TestTaskCFT
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
}

class PickerView: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var button: UIButton!
    var type: PickerType?
    var carService: CarService?
    var options: [String]?
    var carID: Int?
    var currentOption: String?
    var selectedIndexInPicker: Int?
    var output: CarDetailViewOutput?

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
        case .carYear:
            for value in CarService.carYear {
				itemArray.append(String(value))
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
        button?.addTarget(self, action: #selector(saveData(_:)), for: .touchUpInside)
        picker?.selectRow(1, inComponent: 0, animated: true)
        
        selectedIndexInPicker = 0
        if currentOption != nil {
            for i in 0 ..< options!.count {
                if currentOption == options![i] {
                    selectedIndexInPicker = i
                }
            }
        }
        
        picker?.selectRow(selectedIndexInPicker!, inComponent: 0, animated: true)
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = view as? UILabel
        if label == nil {
            label = UILabel()
        }
        
        label?.text = options![row]
        label?.adjustsFontSizeToFitWidth = true
        label?.textAlignment = .center
        return label!
    }
    
    @objc func saveData(_ but: UIButton) {
        let row = picker?.selectedRow(inComponent: 0)
        output!.changeSelectedDataInView(type: type!, value: options![row!])
        self.dismiss(animated: true, completion: nil)
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options!.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
}

