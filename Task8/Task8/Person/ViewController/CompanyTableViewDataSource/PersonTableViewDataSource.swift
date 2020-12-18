//
//  PersonTableViewDataSource.swift
//  Task8
//
//  Created by Admin on 17.12.2020.
//

import Foundation
import UIKit

protocol PersonTableViewDataSourceProtocol {
	func appendItem(_ cellModel: Person)
	func setItems(_ cellModels: [Person])
	func getItem(for indexPath: IndexPath) -> Person?
}

class PersonTableViewDataSource: NSObject,  UITableViewDataSource {
	
	var people: [Person] = [Person]()
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return people.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: PersonCell.cellIdentifier, for: indexPath) as? PersonCell
		
		guard let cellIn = cell else { return UITableViewCell() }
		cellIn.configureCell(model: people[indexPath.row])
		return cellIn
	}
}

extension PersonTableViewDataSource: PersonTableViewDataSourceProtocol {
	
	func appendItem(_ cellModel: Person) {
		people.append(cellModel)
	}
	
	func setItems(_ cellModels: [Person]) {
		people = cellModels
	}
	
	func getItem(for indexPath: IndexPath) -> Person? {
		return people[indexPath.row]
	}
}
