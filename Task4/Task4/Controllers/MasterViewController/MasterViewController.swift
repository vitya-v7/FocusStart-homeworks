//
//MasterViewController//  Task4
//
//  Created by Admin on 06.11.2020.
//

import UIKit

final class MasterViewController: UIViewController {

    // MARK: - User tapped on cell
    var itemSelected = false
    
	// MARK: - Views
	var detailNavigationController: UINavigationController?
	private var masterView: MasterViewProtocol {
		guard let MasterView = view as? MasterViewProtocol else { fatalError() }
		return MasterView
	}

	// MARK: - Life Cycle

	init(navigationTitle: String? = nil) {
		super.init(nibName: nil, bundle: nil)
		navigationItem.title = "ДЗ №4"
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
		if let isCollapsed = self.splitViewController?.isCollapsed, isCollapsed == false {
			pushDetailViewController(with: IndexPath.init(row: 0, section: 0))
		}
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		masterView.viewWillAppear(animated)
	}
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if itemSelected == false {
            pushDetailViewController(with: IndexPath.init(row: 0, section: 0))
        }
    }
}

// MARK: - Master View

private extension MasterViewController {
	func createMasterView() -> UIView {
		let masterView: MasterViewProtocol = MasterView()
		masterView.setItems(CellModel.mockData())
		masterView.selectedItemHandler = { [weak self] indexPath in
			guard let self = self else { return assertionFailure() }
			self.pushDetailViewController(with: indexPath)
		}
		return masterView
	}

	func pushDetailViewController(with indexPath: IndexPath) {
		guard let item: CellModel = masterView.getItem(for: indexPath)
			else { return assertionFailure() }
        itemSelected = true
		if let detail = detailNavigationController?.viewControllers.first as? DetailViewController {
			detail.setItem(item: item)
			splitViewController?.showDetailViewController(detailNavigationController!, sender: nil)
		}
	}
}
