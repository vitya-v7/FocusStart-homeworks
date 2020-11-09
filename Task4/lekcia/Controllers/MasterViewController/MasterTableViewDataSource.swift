//
//  MasterTableViewDataSource.swift
//  lekcia
//
//  Created by Admin on 10.11.2020.
//
import UIKit

protocol MasterTableViewDataSourceProtocol: UITableViewDataSource {
	func setItems(_ CellModels: [CellModel])
	func getItem(for indexPath: IndexPath) -> CellModel
}

final class MasterTableViewDataSource: NSObject {

	// MARK: Properties

	private var CellModels = [CellModel]()
}

// MARK: Data Source Interface

extension MasterTableViewDataSource: MasterTableViewDataSourceProtocol {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return CellModels.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(
			withIdentifier: MasterTableViewCell.reuseIdentifier,
			for: indexPath) as? MasterTableViewCell
			else { assertionFailure(); return UITableViewCell() }

		let masterCellModel = CellModels[indexPath.row]
		cell.configure(object: masterCellModel)
		return cell
	}

	func setItems(_ CellModels: [CellModel]) {
		self.CellModels = CellModels
	}

	func getItem(for indexPath: IndexPath) -> CellModel {
		return CellModels[indexPath.row]
	}
}
