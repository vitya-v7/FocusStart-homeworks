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
		var cell: MainCell
		switch indexPath.row + 1 {
		case 1:
			cell = FirstMasterTableViewCell(style: .default, reuseIdentifier: FirstMasterTableViewCell.reuseIdentifier)
		case 2:
			cell = SecondMasterTableViewCell(style: .default, reuseIdentifier: SecondMasterTableViewCell.reuseIdentifier)
		case 3:
			cell = ThirdMasterTableViewCell(style: .default, reuseIdentifier: ThirdMasterTableViewCell.reuseIdentifier)
		case 4:
			cell = FourthMasterTableViewCell(style: .default, reuseIdentifier: FourthMasterTableViewCell.reuseIdentifier)
		case 5:
			cell = FifthMasterTableViewCell(style: .default, reuseIdentifier: FifthMasterTableViewCell.reuseIdentifier)
		default:
			cell = MainCell()
		}

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
