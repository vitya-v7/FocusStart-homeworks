//
//  PersonViewController.swift
//  Task8
//
//  Created by Admin on 17.12.2020.
//

import UIKit

class PersonViewController: UIViewController {
	
	var company: Company?
	var people = [Person]()
	
	var selectedItemHandler: ((IndexPath?) -> Void)?
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
		people = CoreDataService.shared.fetchPersonsFromCompany(company: company!)
		
		selectedItemHandler = { [weak self] indexPath in
			guard let self = self else { return assertionFailure() }
			let personDetailVC = PersonDetailsViewController()
			personDetailVC.company = self.company
			if indexPath != nil {
				personDetailVC.person = self.people[indexPath!.row]
			}
			else {
				personDetailVC.person = nil
			}
			self.navigationController?.pushViewController(personDetailVC, animated: true)
		}
		myTableView?.tableViewDelegate.setupSelectedItemHandler(selectedItemHandler: selectedItemHandler!)
		setupNavigationBar()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.navigationBar.barTintColor = UIColor.blue
		self.people = CoreDataService.shared.fetchPersonsFromCompany(company: company!)
		self.myTableView?.tableViewDataSource.setItems(self.people)
		self.myTableView?.tableView.reloadData()
	}
	
	func setupNavigationBar() {
		navigationController?.navigationBar.barTintColor = UIColor.blue
		self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white ]
		
		self.title = company?.companyName ?? "unknown company"
		
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add",
																 style: .plain,
																 target: self,
																 action: #selector(addNewPerson))
		
		self.navigationController?.navigationBar.tintColor = .white
	}

	@objc func addNewPerson() {
		self.selectedItemHandler!(nil)
	}
}


