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
}

final class RouterListToDetail
{
	func nextModule() {
		SceneDelegate.coordinatingController!.push(module: .second, parameters: "", animated: true)
	}
}
