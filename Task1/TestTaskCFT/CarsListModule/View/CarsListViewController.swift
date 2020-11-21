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
	func cellWithIndexSelected(row: Int)
	func deleteButtonPressedWithIndexRow(row: Int)
	func plusButtonClicked()
	func viewWillAppearDone()
	func callPopover(fromView view: UIView, option: String?)
	func filterCars(bodyStyle: CarService.CarBodyStyle?)
}

class CarsListViewController: UIViewController, UITextFieldDelegate {
	var output: ICarsListViewOutput?
	var maxCarNumber = 3
	var viewModels: [CarsElementViewModel]?
	
	@IBOutlet var tableView: UITableView?
	
	override func viewDidLoad() {
		super.viewDidLoad()
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
		self.tableView?.delegate = self
		self.tableView?.dataSource = self
	}
	
	func setViewModels(viewModels: [CarsElementViewModel]) {
		self.viewModels = viewModels
		self.tableView?.reloadData()
	}
}

extension CarsListViewController: UITableViewDelegate
{
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		output?.cellWithIndexSelected(row: indexPath.row)
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: CarsElementCell.reuseIdentifier) as! CarsElementCell
		cell.configureCell(withObject: viewModels?[indexPath.row])
		return cell
	}
}

extension CarsListViewController: UITableViewDataSource
{
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 100
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.viewModels?.count ?? 0
	}
}
