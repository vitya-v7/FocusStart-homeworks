//
//  FlowController.swift
//  Task5
//
//  Created by Admin on 16.11.2020.
//  Copyright © 2020 Admin. All rights reserved.
//
import Foundation
import UIKit

final class FlowController
{
	var firstVC: INavigationSeed?
	private var coordinatingController: CoordinatingController
	private var modules = [INavigationSeed]()
	init(coordinatingController: CoordinatingController) {
		self.coordinatingController = coordinatingController
		firstVC = createCarsListModule()
		createCarDetailModule()
		createPopoverModule()
	}
	func createCarsListModule() -> INavigationSeed {


		let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
		let view = storyboard.instantiateViewController(identifier: "CarsListViewIdentifier") as! CarsListViewController
		let carService = CarService.init()
		let presenter = CarsListPresenter()
		let interactor = CarsListInteractor()
		interactor.carService = carService
		presenter.interactor = interactor
		view.output = presenter
		presenter.view = view
		let router = RouterListToDetail()
		presenter.router = router
		self.coordinatingController.registerFirst(module: .listModule, seed: view)
		self.modules.append(view)
		return view

	}


	func createCarDetailModule() -> INavigationSeed {
		let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
		let view = storyboard.instantiateViewController(identifier: "CarDetailViewIdentifier") as! CarDetailViewController
		let carService = CarService.init()
		let detailPresenter = CarDetailPresenter()
		let interactor = CarDetailInteractor()
		interactor.carService = carService
		detailPresenter.interactor = interactor
		view.output = detailPresenter
		detailPresenter.view = view
		let router = RouterDetailToPopover()
		detailPresenter.router = router
		self.coordinatingController.register(module: .detailModule, seed: view)
		return view
	}

	var detailPresenter: CarDetailPresenter?
	var detailview: CarDetailViewController?

	func createPopoverModule() -> INavigationSeed {
		let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
		let pv = storyboard.instantiateViewController(identifier: "PickerViewIdentifier") as! PickerViewController

		pv.modalPresentationStyle = UIModalPresentationStyle.popover
		pv.preferredContentSize = CGSize(width: 300, height: 300)
		pv.picker?.backgroundColor = UIColor.white
		pv.output = detailPresenter
		let popover = pv.popoverPresentationController
		popover?.permittedArrowDirections = .any
		popover?.sourceView = detailview!.view
		popover?.sourceRect = detailview!.view.bounds

		self.coordinatingController.register(module: .popoverModule, seed: pv)
		return pv
	}
}
