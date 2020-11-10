//
//  DetailViewController.swift
//  lekcia
//
//  Created by Admin on 06.11.2020.
//

import UIKit

final class DetailViewController: UIViewController {

	var object: CellModel?
	var myView: DetailView = DetailView(frame: .zero)
	var masterNavigationController: UINavigationController?


	func setItem(item: CellModel) {
		object = item
		self.navigationItem.title = item.title
		myView.configure(object: object)
	}

	// MARK: - Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationController?.navigationBar.prefersLargeTitles = true
	}

	override func viewWillAppear(_ animated: Bool) {
		myView.configure(object: object)
	}

	init(navigationTitle: String? = nil) {
		super.init(nibName: nil, bundle: nil)
		self.navigationController?.title = navigationTitle
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
