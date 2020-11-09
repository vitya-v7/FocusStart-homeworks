//
//  main.swift
//  Task2
//
//  Created by Admin on 25.10.2020.
//

import Foundation

var safeArray = ThreadSafeArray<Int>(array: nil)
let queue = DispatchQueue.global(qos: .default)
let group = DispatchGroup()

group.enter()
queue.async {
	for number in 0...1000 {
		safeArray.append(number)
	}
	group.leave()
}

group.enter()
queue.async {
	for number in 0...1000 {
		safeArray.append(number)
	}
	group.leave()
}

group.wait()
print("Количество элементов в потокобезопасном массиве: \(safeArray.count)")
