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
	var date: Date?

	public static func mockData () -> [Self] {
		return [CellModel(title: "title1", description: "description 1",date: Date.randomDate()),
				CellModel(title: "title2", description: "description 2",date: Date.randomDate()),
				CellModel(title: "title3", description: "description 3",date: Date.randomDate()),
				CellModel(title: "title4", description: "description 4",date: Date.randomDate()),
				CellModel(title: "title5", description: "description 5description 5description 5description 5description 5description 5description 5", date: Date.randomDate())]
	}

}
