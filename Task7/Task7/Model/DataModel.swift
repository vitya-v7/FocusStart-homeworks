//
//  DataModel.swift
//  Task7
//
//  Created by Admin on 15.12.2020.
//

import UIKit
final class DataModel {
	let index: Int
	let image: UIImage
	let imageURL: URL

	init(index: Int, image: UIImage, imageURL: URL) {
		self.index = index
		self.image = image
		self.imageURL = imageURL
	}
}
