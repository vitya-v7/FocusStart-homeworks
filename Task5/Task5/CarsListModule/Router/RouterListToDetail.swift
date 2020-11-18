//
//  RouterListToDetail.swift
//  Task5
//
//  Created by Admin on 16.11.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

protocol IRouterListToDetail: AnyObject
{
	func nextModule(carKey: String?)
}

final class RouterListToDetail: IRouterListToDetail
{
	func nextModule(carKey: String?) {
		SceneDelegate.coordinatingController.push(module: .second, parameters: carKey, animated: true)
	}
}

