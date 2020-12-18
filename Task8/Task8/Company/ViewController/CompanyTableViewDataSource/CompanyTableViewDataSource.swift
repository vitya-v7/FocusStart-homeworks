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

class CompanyTableViewDataSource: NSObject,  UITableViewDataSource {
	
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
