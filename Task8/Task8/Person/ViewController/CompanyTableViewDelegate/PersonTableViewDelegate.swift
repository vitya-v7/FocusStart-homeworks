//
//  PersonTableViewDelegate.swift
//  Task8
//
//  Created by Admin on 17.12.2020.
//

import Foundation
import UIKit

final class PersonTableViewDelegate: NSObject {
	var selectedItemHandler: ((IndexPath) -> Void)?
}

extension PersonTableViewDelegate: UITableViewDelegate {
	
	func setupSelectedItemHandler(selectedItemHandler: @escaping ((IndexPath) -> Void)) {
		self.selectedItemHandler = selectedItemHandler
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		selectedItemHandler!(indexPath)
		tableView.deselectRow(at: indexPath, animated: true)
	}

	
}

