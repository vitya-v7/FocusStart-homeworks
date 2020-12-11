//
//MasterViewController//  Task4
//
//  Created by Admin on 06.11.2020.
//

import UIKit

public protocol MasterViewProtocol: UIView {
	func viewWillAppear(_ animated: Bool)
	var selectedItemHandler: ((IndexPath) -> Void)? { get set }
	func setItems(_ cellModel: [CellModel])
	func getItem(for indexPath: IndexPath) -> CellModel?
}

public final class MasterView: UIView {

	// MARK: - Properties

	public var selectedItemHandler: ((IndexPath) -> Void)?

	private let dataSource: MasterTableViewDataSourceProtocol = MasterTableViewDataSource()
	private let output = MasterTableViewDelegate()

	// MARK: - Views

	private let tableView: UITableView

	// MARK: - Life Cycle

	override init(frame: CGRect) {
		tableView = UITableView(frame: frame)
		super.init(frame: frame)

		setupTableViewAppearances()
		setupTableViewLayout()
		setupSelectedItemHandler()
	}

	public func viewWillAppear(_ animated: Bool) {
		if let selectedIndexPath = tableView.indexPathForSelectedRow {
			tableView.deselectRow(at: selectedIndexPath, animated: animated)
		}
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - View Interface

extension MasterView: MasterViewProtocol {
	public func setItems(_ cellModel: [CellModel]) {
		dataSource.setItems(cellModel)
	}

	public func getItem(for indexPath: IndexPath) -> CellModel? {
		dataSource.getItem(for: indexPath)
	}
}

// MARK: - Views Appearances

private extension MasterView {
	func setupTableViewAppearances() {
		tableView.delegate = output
		tableView.dataSource = dataSource

		tableView.register(
			FirstMasterTableViewCell.self,
			forCellReuseIdentifier: FirstMasterTableViewCell.reuseIdentifier)
		tableView.register(
			SecondMasterTableViewCell.self,
			forCellReuseIdentifier: SecondMasterTableViewCell.reuseIdentifier)
		tableView.register(
			ThirdMasterTableViewCell.self,
			forCellReuseIdentifier: ThirdMasterTableViewCell.reuseIdentifier)
		tableView.register(
			FourthMasterTableViewCell.self,
			forCellReuseIdentifier: FourthMasterTableViewCell.reuseIdentifier)
		tableView.register(
			FifthMasterTableViewCell.self,
			forCellReuseIdentifier: FifthMasterTableViewCell.reuseIdentifier)
		tableView.rowHeight = UITableView.automaticDimension
		tableView.estimatedRowHeight = FirstMasterTableViewCell.getEstimatedHeight()

		tableView.backgroundColor = .systemBackground
	}
}

// MARK: - View Layout

private extension MasterView {
	func setupTableViewLayout() {
		self.addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			tableView.topAnchor.constraint(equalTo: self.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
		])
	}
}

// MARK: - Table Delegate

private extension MasterView {
	func setupSelectedItemHandler() {
		self.output.selectedItemHandler = { [weak self] indexPath in
			guard let self = self else { return assertionFailure() }
			self.selectedItemHandler?(indexPath)
		}
	}
}
