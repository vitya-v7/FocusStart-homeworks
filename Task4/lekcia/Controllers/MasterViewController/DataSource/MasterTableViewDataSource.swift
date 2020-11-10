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
		var cell: UITableViewCell?
		switch indexPath.row + 1 {
		case 1:
			cell = tableView.dequeueReusableCell(withIdentifier: FirstMasterTableViewCell.reuseIdentifier, for: indexPath) as? FirstMasterTableViewCell
		case 2:
			cell = tableView.dequeueReusableCell(withIdentifier: SecondMasterTableViewCell.reuseIdentifier, for: indexPath) as? SecondMasterTableViewCell
		case 3:
			cell = tableView.dequeueReusableCell(withIdentifier: ThirdMasterTableViewCell.reuseIdentifier, for: indexPath) as? ThirdMasterTableViewCell
		case 4:
			cell = tableView.dequeueReusableCell(withIdentifier: FourthMasterTableViewCell.reuseIdentifier, for: indexPath) as? FourthMasterTableViewCell
		case 5:
			cell = tableView.dequeueReusableCell(withIdentifier: FifthMasterTableViewCell.reuseIdentifier, for: indexPath) as? FifthMasterTableViewCell
		default:
			cell = UITableViewCell()
		}
		var cellAccepted = cell as? MainCell
		let masterCellModel = CellModels[indexPath.row]
		cellAccepted?.configure(object: masterCellModel)
		if cellAccepted == nil {
			return UITableViewCell()
		}
		return cellAccepted!
	}

	func setItems(_ CellModels: [CellModel]) {
		self.CellModels = CellModels
	}

	func getItem(for indexPath: IndexPath) -> CellModel {
		return CellModels[indexPath.row]
	}
}
