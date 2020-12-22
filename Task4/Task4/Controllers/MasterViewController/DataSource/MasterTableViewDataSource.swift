//
//  MasterTableViewDataSource.swift
//  Task4
//
//  Created by Admin on 10.11.2020.
//
import UIKit

protocol MasterTableViewDataSourceProtocol: UITableViewDataSource {
	func setItems(_ cellModels: [CellModel])
	func getItem(for indexPath: IndexPath) -> CellModel
}

final class MasterTableViewDataSource: NSObject {

	// MARK: - Constants
	private enum identifier: Int {
		case firstCell = 0
		case secondCell
		case thirdCell
		case fourthCell
		case fifthCell
	}

	// MARK: - Properties
	
	private var dictionaryIndentifies = [
		identifier.firstCell: FirstMasterTableViewCell.reuseIdentifier,
		identifier.secondCell: SecondMasterTableViewCell.reuseIdentifier,
		identifier.thirdCell: ThirdMasterTableViewCell.reuseIdentifier,
		identifier.fourthCell: FourthMasterTableViewCell.reuseIdentifier,
		identifier.fifthCell: FifthMasterTableViewCell.reuseIdentifier]
	private var cellModels = [CellModel]()
}

// MARK: - Data Source Interface

extension MasterTableViewDataSource: MasterTableViewDataSourceProtocol {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return cellModels.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var cell: UITableViewCell?
		cell = tableView.dequeueReusableCell(withIdentifier: dictionaryIndentifies[identifier.init(rawValue: indexPath.row)!]!, for: indexPath) as? MainCell
		let mainCell = cell as? MainCell
		guard let mainCellAccepted = mainCell else { return UITableViewCell() }
		let masterCellModel = cellModels[indexPath.row]
		mainCellAccepted.configure(object: masterCellModel)
		return mainCellAccepted
	}

	func setItems(_ cellModels: [CellModel]) {
		self.cellModels = cellModels
	}

	func getItem(for indexPath: IndexPath) -> CellModel {
		return cellModels[indexPath.row]
	}
}
