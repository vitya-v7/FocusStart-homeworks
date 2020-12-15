//
//  ImageLoaderAssembly.swift
//  Task7
//
//  Created by Admin on 14.12.2020.
//

import UIKit

enum ImageLoaderAssembly {
	static func createImageLoaderTableViewController() -> UIViewController {
		let interactor = ImageLoaderInteractor()
		let presenter = ImageLoaderPresenter(interactor: interactor)
		let imageViewController = ImageLoaderTableViewController()
		imageViewController.presenter = presenter
		presenter.ui = imageViewController.imageView
		presenter.interactor = interactor
		interactor.presenter = presenter
		return imageViewController
	}
}
