//
//  Mock.swift
//  lekcia
//
//  Created by Admin on 08.11.2020.
//

import UIKit

struct Mock {
	var title: String
	var description: String

	static func mockData () -> [Self] {
		return [Mock(title: "title1", description: "description 1"),
						Mock(title: "title2", description: "description 2"),
						Mock(title: "title3", description: "description 3"),
						Mock(title: "title4", description: "description 4"),
						Mock(title: "title5", description: "description 5description 5description 5description 5description 5description 5description 5")]
	}
}

