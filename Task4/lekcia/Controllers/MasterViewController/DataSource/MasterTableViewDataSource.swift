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
	enum identifier: Int {
		case firstCell = 0
		case secondCell
		case thirdCell
		case fourthCell
		case fifthCell
	}
	var dictionaryIndentifies = [
		identifier.firstCell: FirstMasterTableViewCell.reuseIdentifier,
		identifier.secondCell: SecondMasterTableViewCell.reuseIdentifier,
		identifier.thirdCell: ThirdMasterTableViewCell.reuseIdentifier,
		identifier.fourthCell: FourthMasterTableViewCell.reuseIdentifier,
		identifier.fifthCell: FifthMasterTableViewCell.reuseIdentifier]
	private var CellModels = [CellModel]()
}

// MARK: Data Source Interface

extension MasterTableViewDataSource: MasterTableViewDataSourceProtocol {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return CellModels.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var cell: UITableViewCell?
		cell = tableView.dequeueReusableCell(withIdentifier: dictionaryIndentifies[identifier.init(rawValue: indexPath.row)!]!, for: indexPath) as? MainCell
		let cellAccepted = cell as? MainCell
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
