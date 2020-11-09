//
//MasterViewController//  lekcia
//
//  Created by Admin on 06.11.2020.
//

import UIKit

final class MasterViewController: UIViewController {

	// MARK: Views

	private var masterView: MasterViewProtocol {
		guard let MasterView = view as? MasterViewProtocol else { fatalError() }
		return MasterView
	}

	// MARK: Life Cycle

	init(navigationTitle: String) {
		super.init(nibName: nil, bundle: nil)

		self.navigationItem.title = navigationTitle
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func loadView() {
		self.view = createMasterView()
	}

	override func viewDidLoad() {
		super.viewDidLoad()

	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		masterView.viewWillAppear(animated)
	}
}

// MARK: Master View

private extension MasterViewController {
	func createMasterView() -> UIView {
		var masterView: MasterViewProtocol = MasterView()
		masterView.setItems(CellModel.mockData())

		masterView.selectedItemHandler = { [weak self] indexPath in
			guard let self = self else { return assertionFailure() }
			self.pushTodayDetailViewController(with: indexPath)
		}

		return masterView
	}

	func pushTodayDetailViewController(with indexPath: IndexPath) {
		guard let item = masterView.getItem(for: indexPath),
			let detailViewController = DetailViewController() as? UIViewController
			else { return assertionFailure() }
		navigationController?.pushViewController(detailViewController, animated: true)
	}
}
