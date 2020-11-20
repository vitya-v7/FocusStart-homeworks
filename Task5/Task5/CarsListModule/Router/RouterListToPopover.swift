//
//  RouterListToPopover.swift
//  Task5
//
//  Created by Admin on 20.11.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation


protocol IRouterListToPopover: AnyObject
{
	func nextPopoverModule()
}

final class RouterListToPopover: IRouterListToPopover
{
	var listPresenter : ICarsListViewOutput?
	func nextPopoverModule() {
		let parameters = ParametersStruct(pickerType: .carBodyStyle, choice: nil, output: nil, outputList: listPresenter)
		SceneDelegate.coordinatingController.push(module: .popoverModule, parameters: parameters, animated: true)
	}
}

