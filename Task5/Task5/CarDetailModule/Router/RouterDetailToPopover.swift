//
//  RouterDetailToPopover.swift
//  Task5
//
//  Created by Admin on 19.11.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

protocol IRouterDetailToPopoverInput: AnyObject {
	func nextPopoverModule(pickerType: PickerType, choice: String)
}

final class RouterDetailToPopover: IRouterDetailToPopoverInput {
	var detailPresenter : ICarDetailViewOutput?
	func nextPopoverModule(pickerType: PickerType, choice: String) {
		let parameters = ParametersStruct(pickerType: pickerType, choice: choice, output: detailPresenter, outputList: nil)
		SceneDelegate.coordinatingController.push(module: .popoverModule, parameters: parameters, animated: true)
	}
}

