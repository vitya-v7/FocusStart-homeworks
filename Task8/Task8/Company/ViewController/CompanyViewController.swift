//
//  CompanyViewController.swift
//  Task8
//
//  Created by Admin on 17.12.2020.
//

import UIKit

class CompanyViewController: UIViewController {
	
	var companies = [Company]()
	
	var selectedItemHandler: ((IndexPath) -> Void)?
	var myTableView: CompanyTableView?
	init() {
		super.init(nibName: nil, bundle: nil)
		myTableView = CompanyTableView()
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
		self.companies = CoreDataService.shared.fetchCompanies()
		self.myTableView?.tableViewDataSource.setItems(self.companies)
		selectedItemHandler = { [weak self] indexPath in
			guard let self = self else { return assertionFailure() }
			let personVC = PersonViewController()
			personVC.company = self.companies[indexPath.row]
			self.navigationController?.pushViewController(personVC, animated: true)
		}
		myTableView?.tableViewDelegate.setupSelectedItemHandler(selectedItemHandler: selectedItemHandler!)
		setupNavigationBar()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		navigationController?.navigationBar.barTintColor = UIColor.green
	}
	
	func setupNavigationBar() {
		navigationController?.navigationBar.barTintColor = UIColor.green
		self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white ]
		
		self.title = "Companies"
		
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add",
																 style: .plain,
																 target: self,
																 action: #selector(addNewCompany))
		self.navigationController?.navigationBar.tintColor = .white
	}
	
	@objc func addNewCompany() {
		self.showAlert(title: "New company", message: "Enter company name!")
	}
}

private extension CompanyViewController {
	private func showAlert(title: String, message: String) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let save = UIAlertAction(title: "Save", style: .default) { _ in
			let newCompany: Company?
			
			guard let newValue = alert.textFields?.first?.text else { return }
			guard !newValue.isEmpty else { return }
			
			newCompany = CoreDataService.shared.addCompany(newValue)
			
			guard let nonOptNewCompany = newCompany else { return }
			self.companies.append(nonOptNewCompany)
			self.myTableView?.tableViewDataSource.appendItem(nonOptNewCompany)
			self.myTableView?.tableView.reloadData()
			//self.myTableView!.tableView.insertRows(at: [IndexPath(row: self.companies.count - 1, section: 0)], with: .automatic)
		}
		
		let cancel = UIAlertAction(title: "Cancel", style: .destructive) { _ in
			if let indexPath = self.myTableView!.tableView.indexPathForSelectedRow {
				self.myTableView!.tableView.deselectRow(at: indexPath, animated: true)
			}
		}
		
		alert.addTextField()
		alert.addAction(save)
		alert.addAction(cancel)
		
		present(alert, animated: true)
	}
}

