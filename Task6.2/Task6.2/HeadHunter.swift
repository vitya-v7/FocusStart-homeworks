//
//  HeadHunter.swift
//  Task6.2
//
//  Created by Admin on 25.11.2020.
//

import Foundation

protocol IObserverable: AnyObject
{
	associatedtype T
	var value: T? { get set }
	var jobSeekers: [IObserver] { get }

	func register(observer: IObserver)
	func unregister(observer: IObserver)
}

final class Subject<T: RawRepresentable>: IObserverable where T.RawValue == String
{
	var value: T? {
		didSet {
			self.notify(newValue: self.value)
		}
	}
	var jobSeekers = [IObserver]()

	private func notify<T>(newValue: T) {
		jobSeekers.forEach {
			$0.update(with: newValue)
		}
	}
}

extension Subject
{
	func register(observer: IObserver) {
		self.jobSeekers.append(observer)
	}

	func unregister(observer: IObserver) {
		self.jobSeekers = self.jobSeekers.filter { $0.name != observer.name }
	}
}
