//
//  ImageLoaderInteractor.swift
//  Task7
//
//  Created by Admin on 14.12.2020.
//

import UIKit

protocol IImageLoaderInteractorInput: class {
	func loadDataModel(withURL url: URL)
	func verifyUrl (urlString: String?) -> Bool
}

final class ImageLoaderInteractor {
	var temporaryURL: URL?
	weak var presenter: IImageLoaderInteractorOutput?
	private var dataArray: [DataModel] = []
	var dataTaskService = DataTaskService.init()
	init() {
		dataTaskService.completionHandler = { (image:UIImage) -> () in
			let dataModel = DataModel(index: self.dataArray.count,image: image, imageURL: self.temporaryURL!)
			self.dataArray.append(dataModel)
			self.presenter?.dataModelForTableView(dataModel: dataModel)
		}
	}
}

extension ImageLoaderInteractor: IImageLoaderInteractorInput {
	func verifyUrl (urlString: String?) -> Bool {
		if let urlString = urlString {
			if let url = NSURL(string: urlString) {
				return UIApplication.shared.canOpenURL(url as URL)
			}
		}
		print("This is NOT valid URL")
		return false
	}
	
	func loadDataModel(withURL url: URL) {
		for data in self.dataArray {
			if data.imageURL == url {
				print("This image in table already")
				return
			}
		}
		temporaryURL = url
		dataTaskService.launchTask(url: url)
		
	}
}
