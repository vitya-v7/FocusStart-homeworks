//
//  CarsListView.swift
//  TestTask
//
//  Created by Viktor D. on 16.09.2020.
//  Copyright © 2020 Viktor D. All rights reserved.
//

import UIKit

protocol ICarsListViewInput : UIViewController {
	func setInitialState()
	func setViewModels(viewModels: [CarsElementViewModel])
	
}
protocol IUI: AnyObject
{
	var tapButtonHandler: (() -> Void)? { get set }
}
protocol ICarsListViewOutput {
	func viewDidLoadDone()
	func cellWithIndexSelected(row: Int)
	func deleteButtonPressedWithIndexRow(row: Int)
	func plusButtonClicked()
	func viewWillAppearDone()
	func callPopover(fromView view: UIView, option: String?)
	func filterCars(bodyStyle: CarService.CarBodyStyle?)
	func viewDidLoad(ui: IUI)
}

class CarsListViewController: UIViewController, UITextFieldDelegate {
	var output: ICarsListViewOutput?
	var maxCarNumber = 3
	var dataSource: CarsListDataSourceProtocol = CarsListDataSource()

	var delegate: CarsListDelegate = CarsListDelegate()

	private let coordinatingController: CoordinatingController


	@IBOutlet var tableView: UITableView?

	init(coordinatingController: CoordinatingController) {
		self.coordinatingController = coordinatingController

		self.customView.tapButtonHandler = { [weak self] in
			self?.coordinatingController.push(module: .second, parameters: "", animated: true)
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.tableView?.delegate = delegate
		self.tableView?.dataSource = dataSource
		output?.viewDidLoadDone()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		output?.viewWillAppearDone()
	}
	
	@objc func insertNewObject(_ sender: Any) {
		output?.plusButtonClicked()
	}
	
	@objc func filerCarsByBodyStyle(_ sender: Any) {
		output?.callPopover(fromView: self.view, option: nil)
	}
}

extension CarsListViewController: ICarsListViewInput
{
	func setInitialState() {
		let rightButton = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
		let leftButton = UIBarButtonItem.init(title: "Filter", style: .plain, target: self, action: #selector(filerCarsByBodyStyle(_:)))
		self.navigationItem.rightBarButtonItem = rightButton
		self.navigationItem.leftBarButtonItem = leftButton


	}
	
	func setViewModels(viewModels: [CarsElementViewModel]) {
		dataSource.setItems(viewModels)
		self.tableView?.reloadData()
	}
}


extension CarsListViewController: INavigationSeed
{
	var vc: UIViewController { self }
}
