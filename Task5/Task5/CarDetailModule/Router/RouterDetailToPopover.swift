//
//  RouterDetailToPopover.swift
//  Task5
//
//  Created by Admin on 19.11.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

protocol IRouterDetailToPopoverInput: AnyObject {
	func nextPopoverModule(pickerType: PickerType, currentChoice: String)
}

final class RouterDetailToPopover: IRouterDetailToPopoverInput {
	var detailPresenter : CarDetailPresenter?
	func nextPopoverModule(pickerType: PickerType, currentChoice: String) {
		let parameters = ParametersStruct(pickerType: pickerType, currentChoice: currentChoice, output: detailPresenter, outputList: nil)
		SceneDelegate.coordinatingController.push(module: .popoverModule, parameters: parameters, animated: true)
	}
}

