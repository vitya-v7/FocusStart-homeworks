//
//  RouterToDetailModule.swift
//  Task5
//
//  Created by Admin on 16.11.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

protocol IRouterListToDetail: AnyObject
{
	func nextModule()
	var coordinatingController: CoordinatingController { get  }
	var flowController: FlowController { get set }
}

final class RouterListToDetail
{

	let coordinatingController = CoordinatingController()
	
	lazy var flowController = FlowController(coordinatingController: self.coordinatingController)

	func nextModule() {
		coordinatingController.push(module: .second, parameters: "", animated: true)
	}
}
