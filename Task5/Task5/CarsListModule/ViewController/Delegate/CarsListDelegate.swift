//
//  CarsListDelegate.swift
//  Task5
//
//  Created by Admin on 16.11.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import UIKit

protocol CarsListDelegateProtocol: UITableViewDelegate {
	var selectedItemHandler: ((IndexPath) -> Void)? { get set }
}

class CarsListDelegate: NSObject, CarsListDelegateProtocol {
	var selectedItemHandler: ((IndexPath) -> Void)? = {item1 in return}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.selectedItemHandler?(indexPath)
		tableView.deselectRow(at: indexPath, animated: true)
	}

}
