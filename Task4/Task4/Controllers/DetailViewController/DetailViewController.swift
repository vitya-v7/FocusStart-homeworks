//
//  DetailViewController.swift
//  Task4
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
		let label = UILabel()
		label.backgroundColor = .clear
		label.numberOfLines = 2
		label.font = UIFont.boldSystemFont(ofSize: 16.0)
		label.textAlignment = .center
		label.textColor = .black
		if #available(iOS 13.0, *) {
			if UITraitCollection.current.userInterfaceStyle == .dark {
				label.textColor = .white
			}
		}
		label.text = item.title
		self.navigationItem.titleView = label
		//self.navigationItem.title = item.title
		myView.configure(object: object)
	}

	// MARK: - Life Cycle

	override func loadView() {
		view = myView
	}
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
