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

protocol IImageLoaderInteractorOutput: class {
	func dataModelForTableView(dataModel: DataModel)
}

final class ImageLoaderInteractor {
	weak var presenter: IImageLoaderInteractorOutput?
	private var dataArray: [DataModel] = []
	private var imageDownloadingDelegate: ImageDownloadingDelegate?
	var downloadService = DownloadService.init()
	private let dataTaskService = DataTaskService()
	init() {
		self.imageDownloadingDelegate = ImageDownloadingDelegate()
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
		
		dataTaskService.dataTask(from: url) { [weak self] (image) in
			let dataModel = DataModel(index: self?.dataArray.count ?? 0,image: image, imageURL: url)
			self?.dataArray.append(dataModel)
			self?.presenter?.dataModelForTableView(dataModel: dataModel)
		} errorCompletion: { [weak self] (error) in
			print(error.localizedDescription)
		}
	}

}
