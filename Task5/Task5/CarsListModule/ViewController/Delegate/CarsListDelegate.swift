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
	var view: CarsListViewProtocolForDelegate?
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		view?.cellSelectedAt(indexPath: indexPath)
	}
}
