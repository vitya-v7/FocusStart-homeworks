//
//  CellModel.swift
//  Task4
//
//  Created by Admin on 07.11.2020.
//

import UIKit

public struct CellModel {
	let title: String?
	var description: String?
	var date: Date?
	var firstImage: UIImage?
	var secondImage: UIImage?
	public static func mockData () -> [Self] {
		return [CellModel(title: "title1", description: "description 1fdsafdsfdsfdsfadf",date: Date.randomDate(), firstImage: UIImage.init(named: ImagesNames.DogName.rawValue), secondImage: UIImage.init(named: ImagesNames.RatName.rawValue)),
				CellModel(title: """
					title2
					title2223
					""", description: "description 2 fddfdsafdsafsdaffdsafsdaf",date: Date.randomDate(), firstImage: UIImage.init(named: ImagesNames.PandaName.rawValue), secondImage: UIImage.init(named: ImagesNames.BelkaName.rawValue)),
				CellModel(title: "title3", description: "description 3 fkdsafk;lsdajf;kljasdfkldsjajflasdfasfsa", firstImage: UIImage.init(named: ImagesNames.KosulaName.rawValue), secondImage: UIImage.init(named: ImagesNames.LionName.rawValue)),
				CellModel(title: "title4", description: """
					FirstLine
					SecondLine
					""", date: Date.randomDate(), firstImage: UIImage.init(named: ImagesNames.WolfName.rawValue), secondImage: UIImage.init(named: ImagesNames.CatName.rawValue)),
				CellModel(title: "title5", firstImage: UIImage.init(named: ImagesNames.HorsesName.rawValue), secondImage: UIImage.init(named: ImagesNames.BearName.rawValue))]
	}
}
