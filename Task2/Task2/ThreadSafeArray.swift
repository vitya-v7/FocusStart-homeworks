//
//  ThreadSafeArray.swift
//  Task2
//
//  Created by Admin on 26.10.2020.
//

import Foundation

class ThreadSafeArray <Element>
{
	private var safeArray: Array <Element>
	private let queue = DispatchQueue(label: "com.Task2.queue", attributes: .concurrent)
	
	var count: Int {
		var countIn = 0
		self.queue.sync {
			countIn = self.safeArray.count
		}
		return countIn
	}

	var isEmpty: Bool {
		var emptyBool = true
		self.queue.sync {
			emptyBool = self.safeArray.isEmpty
		}
		return emptyBool
	}

	init(array: Array <Element>?) {
		if let arrayIn = array {
			self.safeArray = arrayIn
		}
		else {
			self.safeArray = Array <Element>()
		}
	}

	func append(_ item: Element) {
		queue.async(flags: .barrier) {
			self.safeArray.append(item)
		}
	}

	func remove(at index: Int) {
		queue.async(flags: .barrier) {
			self.safeArray.remove(at: index)
		}
	}

	subscript(index: Int) -> Element? {
		get {
			var value: Element?
			self.queue.sync {
				if index >= 0 && index < self.safeArray.count {
					value = self.safeArray[index]
				}
			}
			return value
		}
		set {
			if let newValue = newValue {
				self.queue.async(flags: .barrier) {
					if index >= 0 && index < self.safeArray.count {
						self.safeArray[index] = newValue
					}
				}
			}
		}
	}
}

extension ThreadSafeArray where Element: Equatable
{
	func contains(_ element: Element) -> Bool {
		var value = false
		self.queue.sync {
			value = self.safeArray.contains { arrayItem in
				return element == arrayItem
			}
		}
		return value
	}
}
