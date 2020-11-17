//
//  CoordinatingController.swift
//  Task5
//
//  Created by Admin on 16.11.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import UIKit

public protocol INavigationSeed: AnyObject
{
	var vc: UIViewController { get }
	func set<Parameters>(module:[NavigationModule: INavigationSeed], parameters: Parameters)
}
extension INavigationSeed
{
	func set<Parameters>(module:[NavigationModule: INavigationSeed], parameters: Parameters) {
		if let secondModule = module[.second] {
			let detailVC = secondModule.vc as! CarDetailViewController
			detailVC.key = parameters as? String
		}
	}
}
enum NavigationModule
{
	case first
	case second
}

protocol ICoordinatingController: AnyObject
{
	func back(animated: Bool)
	func push<Parameters>(module: NavigationModule, parameters: Parameters, animated: Bool)
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


	func push<Parameters>(module: NavigationModule, parameters: Parameters, animated: Bool) {
		guard let nextModule = self.modules[module] else {
			assertionFailure("module didn't register")
			return
		}
		if self.stack.last?.vc === nextModule.vc { self.stack.removeLast() }
		guard let nc = self.stack.last?.vc.navigationController else {
			assertionFailure("navigationController is nil, push unavailable")
			return
		}
		nextModule.set(module: self.modules[module], parameters: parameters)



		nc.pushViewController(nextModule.vc, animated: animated)
		self.stack.append(nextModule)
	}
}
