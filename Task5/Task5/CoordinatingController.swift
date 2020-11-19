//
//  CoordinatingController.swift
//  Task5
//
//  Created by Admin on 16.11.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import UIKit


protocol INavigationSeed: AnyObject
{
	var vc: UIViewController { get }

	func set<Parameters>(parameters: Parameters)
}

extension INavigationSeed
{
	func set<Parameters>(parameters: Parameters) {
		// do nothing
	}
}

public enum NavigationModule
{
	case listModule
	case detailModule
	case popoverModule
}

protocol ICoordinatingController: AnyObject
{
	func back(animated: Bool)
	func push<Parameters>(module: NavigationModule, parameters: Parameters?, animated: Bool)
}


final class CoordinatingController
{

	private var modules = [NavigationModule: INavigationSeed]()
	private var stack = [INavigationSeed]()

	func register(module: NavigationModule, seed: INavigationSeed) {
		self.modules[module] = seed
	}

	func registerFirst(module: NavigationModule, seed: INavigationSeed) {
		self.modules[module] = seed
		self.stack.append(seed)
	}


}

extension CoordinatingController: ICoordinatingController
{
	func back(animated: Bool) {
		let last = self.stack.popLast()
		guard let nc = last?.vc.navigationController else {
			last?.vc.dismiss(animated: animated)
			return
		}
		nc.popViewController(animated: animated)
	}
	

	func push<Parameters>(module: NavigationModule, parameters: Parameters?, animated: Bool) {

		guard let nextModule = self.modules[module] else {
			assertionFailure("module didn't register")
			return
		}
		if self.stack.last?.vc === nextModule.vc { self.stack.removeLast() }
		guard let nc = self.stack.last?.vc.navigationController else {
			assertionFailure("navigationController is nil, push unavailable")
			return
		}
		switch module {
		case .detailModule:
			nc.pushViewController(nextModule.vc, animated: animated)
		case .popoverModule:
			nc.present(nextModule.vc, animated: true, completion: nil)
		default:
			fatalError("this module does not exist!")
		}
		
		self.stack.append(nextModule)
		if parameters != nil {
			nextModule.set(parameters: parameters)
		}
	}
}
