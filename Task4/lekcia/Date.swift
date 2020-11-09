//
//  Date.swift
//  lekcia
//
//  Created by Admin on 07.11.2020.
//

import Foundation

extension Date {

	static func randomDate() -> Date {
		let randomTime = TimeInterval(arc4random())

		return Date(timeIntervalSince1970: randomTime)
	}
}
