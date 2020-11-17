//
//  CarsListDelegate.swift
//  Task5
//
//  Created by Admin on 16.11.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import UIKit


class CarsListDelegate: NSObject, UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		(tableView.cellForRow(at: indexPath) as! CarsElementCell).viewModel?.tapButtonHandler
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
