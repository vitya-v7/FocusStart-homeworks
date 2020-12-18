//
//  PersonTableView.swift
//  Task8
//
//  Created by Admin on 17.12.2020.
//

import UIKit

class PersonTableView: UIView {

	let tableView = UITableView()
	var tableViewDataSource = PersonTableViewDataSource()
	var tableViewDelegate = PersonTableViewDelegate()

	init() {
		super.init(frame: .zero)
		//tableView.rowHeight = 200
		setupTableView()
	}
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func setupTableView() {
		setupTableViewAppearances()
		setupTableViewLayout()
	}

	func setupTableViewAppearances() {
		tableView.delegate = tableViewDelegate
		tableView.dataSource = tableViewDataSource
		tableView.register(PersonCell.self, forCellReuseIdentifier: PersonCell.cellIdentifier)
		tableView.rowHeight = UITableView.automaticDimension
		//tableView.estimatedRowHeight = FirstMasterTableViewCell.getEstimatedHeight()

		//tableView.backgroundColor = .white
	}

	func setupTableViewLayout() {
		self.addSubview(tableView)
		self.tableView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			self.tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			self.tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
			self.tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
			self.tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
		])
	}

}
