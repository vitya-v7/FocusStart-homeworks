//
//  RouterListToDetail.swift
//  Task5
//
//  Created by Admin on 16.11.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

protocol IRouterListToDetail: AnyObject {
	func nextDetailModule(carKey: String?)
}

final class RouterListToDetail: IRouterListToDetail {
	func nextDetailModule(carKey: String?) {
		SceneDelegate.coordinatingController.push(module: .detailModule, parameters: carKey, animated: true)
	}
}

