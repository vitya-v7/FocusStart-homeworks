//
//  ImageLoaderTableView.swift
//  Task7
//
//  Created by Admin on 14.12.2020.
//

import UIKit

protocol IImageLoaderTableView: class {
    var findImage: ((String) -> Void)? { get set }
    func setupDataViewModel(dataViewModel: DataViewModel)
}

final class ImageLoaderTableView: UIView {
	// MARK: - Views
	var navigationItem: UINavigationItem?

	lazy var tableView: UITableView = {
		let tableView = UITableView()
		return tableView
	}()


	// MARK: - Properties
	private var tableViewDataSource = ImageLoaderTableViewDataSource()
    var findImage: ((String) -> Void)?

    // MARK: - Init

	init() {
        super.init(frame: .zero)
		tableView.rowHeight = Constants.tableViewRowHeight
		self.registerTableViewCell()
		setupTableView()
		setupDataSource()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI Setup

extension ImageLoaderTableView {


    func setupTableView() {
		self.addSubview(tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			self.tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			self.tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
			self.tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
			self.tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
		])

    }

    private func registerTableViewCell() {
        self.tableView.register(ImageLoaderTableViewCell.self, forCellReuseIdentifier: ImageLoaderTableViewCell.reuseIdentifier)
    }
}

// MARK: - IImageLoaderTableView

extension ImageLoaderTableView: IImageLoaderTableView {
	
    func setupDataViewModel(dataViewModel: DataViewModel) {
        self.tableViewDataSource.dataArray.append(dataViewModel)
        self.tableView.reloadData()
    }

}

// MARK: - DataSource и Delegate для tableView

private extension ImageLoaderTableView {
    func setupDataSource() {
        self.tableView.dataSource = tableViewDataSource
    }
}


