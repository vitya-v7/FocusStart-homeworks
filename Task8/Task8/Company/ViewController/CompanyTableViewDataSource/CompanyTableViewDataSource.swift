//
//  CompanyTableViewDataSource.swift
//  Task8
//
//  Created by Admin on 17.12.2020.
//

import Foundation
import UIKit

protocol CompanyTableViewDataSourceProtocol {
	func appendItem(_ cellModel: Company)
	func setItems(_ cellModels: [Company])
	func getItem(for indexPath: IndexPath) -> Company?
}

protocol RemoveCompanyFromModels {
	func removeCompany(at indexPath: IndexPath)
}

final class CompanyTableViewDataSource: NSObject,  UITableViewDataSource {
	var delegate: RemoveCompanyFromModels?
	var companies: [Company] = [Company]()
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return companies.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: CompanyCell.cellIdentifier, for: indexPath) as? CompanyCell
		
		guard let cellIn = cell else { return UITableViewCell() }
		cellIn.configureCell(model: companies[indexPath.row])
		return cellIn
	}

	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			CoreDataService.shared.deleteCompany(companies[indexPath.row])
			companies.remove(at: indexPath.row)
			delegate?.removeCompany(at: indexPath)
		}
	}
}

extension CompanyTableViewDataSource: CompanyTableViewDataSourceProtocol {	
	func setItems(_ cellModels: [Company]) {
		companies = cellModels
	}
	
	func appendItem(_ cellModel: Company) {
		companies.append(cellModel)
	}
	
	func getItem(for indexPath: IndexPath) -> Company? {
		return companies[indexPath.row]
	}
}
