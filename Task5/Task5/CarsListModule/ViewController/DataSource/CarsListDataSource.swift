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
	func setItems(_ CellModels: [CarsElementViewModel]) {
		cellModels = CellModels
	}

	func getItem(for indexPath: IndexPath) -> CarsElementViewModel {
		return cellModels[indexPath.row]
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: CarsElementCell.reuseIdentifier) as! CarsElementCell
		if cell.handlerChain == nil {
			cell.handlerChain = handlerChain()
		}
		cell.handlerChain!.index = indexPath.row
		cell.delegate = view
		cell.configureCell(withObject: cellModels[indexPath.row])

		return cell
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.cellModels.count
	}
}
