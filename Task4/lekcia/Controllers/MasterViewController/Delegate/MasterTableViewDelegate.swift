//
//  MasterTableViewDelegate.swift
//  lekcia
//
//  Created by Admin on 08.11.2020.
//

import UIKit

final class MasterTableViewDelegate: NSObject {
	var selectedItemHandler: ((IndexPath) -> Void)?
}

extension MasterTableViewDelegate: UITableViewDelegate {

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		self.selectedItemHandler?(indexPath)
		tableView.deselectRow(at: indexPath, animated: true)
	}
	func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
		tableView.cellForRow(at: indexPath)?.backgroundColor = .red
		return true
	}
	func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
		tableView.cellForRow(at: indexPath)?.tintColor = .red
	}
	func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
		tableView.cellForRow(at: indexPath)?.backgroundColor = .white
	}
}
