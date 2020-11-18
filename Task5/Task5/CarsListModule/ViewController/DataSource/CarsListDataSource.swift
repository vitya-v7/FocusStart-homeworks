//
//  CarsListDataSource.swift
//  Task5
//
//  Created by Admin on 16.11.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
protocol CarsListDataSourceProtocol: UITableViewDataSource {
	func setItems(_ CellModels: [CarsElementViewModel])
	func getItem(for indexPath: IndexPath) -> CarsElementViewModel
	var view: IViewForRoutingProtocol? { get set }
}



class CarsListDataSource: NSObject, CarsListDataSourceProtocol {

	var cellModels = [CarsElementViewModel]()
	var view: IViewForRoutingProtocol?
	var handlerChain: [UIView]?
	func setItems(_ CellModels: [CarsElementViewModel]) {
		cellModels = CellModels
		handlerChain = [UIView].init(repeating: UIView(),  count: cellModels.count)
	}

	func getItem(for indexPath: IndexPath) -> CarsElementViewModel {
		return cellModels[indexPath.row]
	}
	var cells = [CarsElementCell]()
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: CarsElementCell.reuseIdentifier) as! CarsElementCell
		cell.indexRow = indexPath.row
		view?.callNextModule(ui: cell)

		cell.configureCell(withObject: cellModels[indexPath.row])
		cells.append(cell)
		return cell
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.cellModels.count
	}
}
