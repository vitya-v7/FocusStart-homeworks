//
//  ImageLoaderViewController.swift
//  Task7
//
//  Created by Admin on 14.12.2020.
//

import UIKit


class ImageLoaderTableViewController: UIViewController {

	var imageView : ImageLoaderTableView?
	var presenter: IImageLoaderTableViewOutput?
	var searchController = UISearchController.init(searchResultsController: nil)
	
	init() {
		super.init(nibName: nil, bundle: nil)
		imageView = ImageLoaderTableView()
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) error")
	}
	
	// MARK: - Lifecycle
	
	override func loadView() {
		self.view = imageView
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		searchController.searchBar.delegate = self
		navigationItem.hidesSearchBarWhenScrolling = false
		navigationController?.navigationBar.backgroundColor = .white
		navigationItem.searchController = searchController
		
		presenter?.viewDidLoadDone(ui: imageView!)
		
	}
	override func viewWillAppear(_ animated: Bool) {
		self.extendedLayoutIncludesOpaqueBars = false
	}
}

// MARK: - UISearchBarDelegate

extension ImageLoaderTableViewController: UISearchBarDelegate {
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		guard let filterString = searchBar.text else {
			return
		}
		imageView!.findImage?(filterString)
		searchBar.resignFirstResponder()
	}
}
