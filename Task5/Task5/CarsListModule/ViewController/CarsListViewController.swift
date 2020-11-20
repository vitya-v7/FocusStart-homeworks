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
	func viewDidLoadDone()
	func deleteButtonPressedWithIndexRow(row: Int)
	func viewWillAppearDone()
	func callPopover()
	func filterCars(bodyStyle: CarService.CarBodyStyle?)
	func cellSelectedAt(indexPath: IndexPath)
	func plusButtonClicked()
}

protocol CarsListViewProtocolForDelegate {
	func cellSelectedAt(indexPath: IndexPath)
}

class CarsListViewController: UIViewController, UITextFieldDelegate{
	var maxCarNumber = 3

	var output: ICarsListViewOutput?
	
	var dataSource: CarsListDataSourceProtocol = CarsListDataSource()

	var delegate: CarsListDelegate = CarsListDelegate()

	@IBOutlet var tableView: UITableView?

	
	required init?(coder aDecoder: NSCoder) {
	   super.init(coder: aDecoder)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.tableView?.delegate = delegate
		self.tableView?.dataSource = dataSource
		delegate.view = self
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
		output?.callPopover()
	}


}

extension CarsListViewController: CarsListViewProtocolForDelegate {
	func cellSelectedAt(indexPath: IndexPath) {
		output?.cellSelectedAt(indexPath: indexPath)
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


