//
//  ImageLoaderPresenter.swift
//  Task7
//
//  Created by Admin on 14.12.2020.
//

import UIKit


protocol IImageLoaderTableViewOutput: class {
	func viewDidLoadDone(ui: IImageLoaderTableView)
}

final class ImageLoaderPresenter {
	var interactor: IImageLoaderInteractorInput
    weak var ui: IImageLoaderTableView?
	var dataViewModels: [DataViewModel]
    init(interactor: IImageLoaderInteractorInput) {
        self.interactor = interactor
		dataViewModels = [DataViewModel]()
    }
}

// MARK: - IImageLoaderPresenter

extension ImageLoaderPresenter: IImageLoaderTableViewOutput {
    func viewDidLoadDone(ui: IImageLoaderTableView) {
        self.ui = ui
        self.ui?.findImage = { [weak self] stringURL in
            guard let url = URL(string: stringURL) else {
                print("error in ViewDidLoadDone: string URL isn't valid")
                return
            }
            self?.interactor.loadDataModel(withURL: url)
        }
    }
}

// MARK: - IImageLoaderInteractorOutput

extension ImageLoaderPresenter: IImageLoaderInteractorOutput {

	func convertModelToViewModel(model: DataModel) -> DataViewModel {
		let viewModel = DataViewModel(image: model.image)
		return viewModel
	}
    func dataModelForTableView(dataModel: DataModel) {
		let davaViewModel = convertModelToViewModel(model: dataModel)
		dataViewModels.append(davaViewModel)
		DispatchQueue.main.async {
			self.ui?.setupDataViewModel(dataViewModel: davaViewModel)
		}

    }
}
