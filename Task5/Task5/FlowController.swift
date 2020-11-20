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
		createCarDetailModule(type: .detailModule)
		createPopoverModule(type: .popoverModule)
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
		let routerToPopover = RouterListToPopover()
		routerToPopover.listPresenter = presenter
		presenter.router = router
		presenter.routerToPopover = routerToPopover
		self.coordinatingController.registerFirst(module: .listModule, seed: view)
		self.modules.append(view)
		return view

	}


	func createCarDetailModule(type: NavigationModule) -> INavigationSeed {
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
		router.detailPresenter = detailPresenter
		detailPresenter.router = router
		self.coordinatingController.register(module: type, seed: view)
		return view
	}

	func createPopoverModule(type: NavigationModule) -> INavigationSeed {
		let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
		let pv = storyboard.instantiateViewController(identifier: "PickerViewIdentifier") as! PickerViewController

		pv.modalPresentationStyle = UIModalPresentationStyle.popover
		pv.preferredContentSize = CGSize(width: 300, height: 300)
		pv.picker?.backgroundColor = UIColor.white
		let popover = pv.popoverPresentationController
		popover?.permittedArrowDirections = .any
		popover?.sourceView = UIView()
		popover?.sourceRect = UIView().bounds

		self.coordinatingController.register(module: type, seed: pv)
		return pv
	}

}
