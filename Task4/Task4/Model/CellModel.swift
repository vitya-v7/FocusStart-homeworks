//
//  CellModel.swift
//  Task4
//
//  Created by Admin on 07.11.2020.
//

import UIKit

public struct CellModel {

	//MARK: - Constants
	private enum ImagesNames {
		static let DogName = "cute-dog"
		static let RatName = "cute-rat"
		static let PandaName = "cute-panda"
		static let BelkaName = "cute-belka"
		static let KosulaName = "cute-kosula"
		static let LionName = "cute-lion"
		static let WolfName = "cute-wolf"
		static let CatName = "cute-cat"
		static let HorsesName = "cute-horses"
		static let BearName = "cute-bear"
	}

	let title: String?
	var description: String?
	var date: Date?
	var firstImage: UIImage?
	var secondImage: UIImage?
	public static func mockData () -> [Self] {
		return [CellModel(title: "title1", description: "description 1fdsafdsfdsfdsfadf",date: Date.randomDate(), firstImage: UIImage.init(named: ImagesNames.DogName), secondImage: UIImage.init(named: ImagesNames.RatName)),
				CellModel(title: """
					title2
					title2223
					""", description: "description 2 fddfdsafdsafsdaffdsafsdaf",date: Date.randomDate(), firstImage: UIImage.init(named: ImagesNames.PandaName), secondImage: UIImage.init(named: ImagesNames.BelkaName)),
				CellModel(title: "title3", description: "description 3 fkdsafk;lsdajf;kljasdfkldsjajflasdfasfsa", firstImage: UIImage.init(named: ImagesNames.KosulaName), secondImage: UIImage.init(named: ImagesNames.LionName)),
				CellModel(title: "title4", description: """
					FirstLine
					SecondLine
					""", date: Date.randomDate(), firstImage: UIImage.init(named: ImagesNames.WolfName), secondImage: UIImage.init(named: ImagesNames.CatName)),
				CellModel(title: "title5", firstImage: UIImage.init(named: ImagesNames.HorsesName), secondImage: UIImage.init(named: ImagesNames.BearName))]
	}
}
