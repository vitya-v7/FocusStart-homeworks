//
//  RouterDetailToPopover.swift
//  Task5
//
//  Created by Admin on 19.11.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

struct ParametersStruct {
	var pickerType: PickerType
	var choice: String
}

protocol IRouterDetailToPopover: AnyObject
{
	func nextPopoverModule(pickerType: PickerType, choice: String)
}

final class RouterDetailToPopover: IRouterDetailToPopover
{

	func nextPopoverModule(pickerType: PickerType, choice: String) {
		let parameters = ParametersStruct(pickerType: pickerType, choice: choice)
		SceneDelegate.coordinatingController.push(module: .popoverModule, parameters: parameters, animated: true)
	}


	
}

