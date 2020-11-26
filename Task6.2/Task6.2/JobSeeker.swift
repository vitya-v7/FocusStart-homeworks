//
//  JobSeeker.swift
//  Task6.2
//
//  Created by Admin on 25.11.2020.
//

import Foundation

protocol IObserver: AnyObject
{
	var name: SceneDelegate.Names { get }

	func update<T>(with value: T)
}

final class Observer: IObserver
{
	var name: SceneDelegate.Names

	init(name: SceneDelegate.Names) {
		self.name = name
	}

	func update<T>(with value: T) {
		
		let valueIn = value as? SceneDelegate.Professions
		if let value = valueIn {
			print(self.name, "we offer you a job: ", value.rawValue)
		}
	}
}

