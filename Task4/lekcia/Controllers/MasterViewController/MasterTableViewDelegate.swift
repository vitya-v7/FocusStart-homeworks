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
	}
}
