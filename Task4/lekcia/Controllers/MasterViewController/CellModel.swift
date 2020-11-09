//
//  CellModel.swift
//  lekcia
//
//  Created by Admin on 07.11.2020.
//

import UIKit

public struct CellModel {
	let title: String?
	var description: String?
	var date: String?

	public static func mockData () -> [Self] {
		let formatter = DateFormatter()
		formatter.dateFormat = "HH:mm"
		return [CellModel(title: "title1", description: "description 1",date: formatter.string(from: Date.randomDate())),
				CellModel(title: "title2", description: "description 2",date: formatter.string(from: Date.randomDate())),
				CellModel(title: "title3", description: "description 3",date: formatter.string(from: Date.randomDate())),
				CellModel(title: "title4", description: "description 4",date:formatter.string(from: Date.randomDate())),
				CellModel(title: "title5", description: "description 5description 5description 5description 5description 5description 5description 5", date: formatter.string(from: Date.randomDate()))]
	}

}
