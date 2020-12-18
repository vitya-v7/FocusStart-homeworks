//
//  PersonViewController.swift
//  Task8
//
//  Created by Admin on 17.12.2020.
//

import UIKit

class PersonViewController: UIViewController {
	
	var companies = [Person]()
	
	var selectedItemHandler: ((IndexPath) -> Void)?
	var myTableView: PersonTableView?
	init() {
		super.init(nibName: nil, bundle: nil)
		myTableView = PersonTableView()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) error")
	}

	// MARK: - Lifecycle

	override func loadView() {
		self.view = myTableView
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		selectedItemHandler = { [weak self] indexPath in
			guard let self = self else { return assertionFailure() }
			//self.navigationController?.pushViewController(PersonViewController(), animated: true)
		}
		myTableView?.tableViewDelegate.setupSelectedItemHandler(selectedItemHandler: selectedItemHandler!)
		setupNavigationBar()
	}


	func setupNavigationBar() {
		navigationController?.navigationBar.barTintColor = UIColor.red
		self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white ]

		self.title = "Person"

		self.navigationController?.navigationBar.tintColor = .white
	}

}


