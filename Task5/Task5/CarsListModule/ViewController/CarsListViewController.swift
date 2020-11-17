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

protocol ICarsListViewOutput {
	func viewDidLoadDone(ui: IUI)
	func cellWithIndexSelected(row: Int)
	func deleteButtonPressedWithIndexRow(row: Int)
	func plusButtonClicked()
	func viewWillAppearDone()
	func callPopover(fromView view: UIView, option: String?)
	func filterCars(bodyStyle: CarService.CarBodyStyle?)
	
}

protocol IViewForRoutingProtocol {
	func callNextModule(ui: IUI)
}

class CarsListViewController: UIViewController, UITextFieldDelegate, IViewForRoutingProtocol{
	var maxCarNumber = 3

	var output: ICarsListViewOutput?
	
	var dataSource: CarsListDataSourceProtocol = CarsListDataSource()

	var delegate: CarsListDelegate = CarsListDelegate()

	@IBOutlet var tableView: UITableView?

	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.tableView?.delegate = delegate
		self.tableView?.dataSource = dataSource
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

	func callNextModule(ui: IUI) {
		output?.viewDidLoadDone(ui: ui)
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
