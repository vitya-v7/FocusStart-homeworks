//
//  SceneDelegate.swift
//  lekcia
//
//  Created by Admin on 06.11.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	var window: UIWindow?
	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = scene as? UIWindowScene else { return assertionFailure() }
		window = UIWindow(frame: windowScene.coordinateSpace.bounds)

		guard let window = window else { return assertionFailure() }
		window.windowScene = windowScene

		let masterController = MasterViewController(navigationTitle: "Master")
		let masterNavigationController = UINavigationController(rootViewController: masterController)

		let detailController = DetailViewController(navigationTitle: "Detail")
		let detailNavigationController = UINavigationController(rootViewController: detailController)

		let splitViewController =  MainSplitViewController()
		splitViewController.viewControllers = [masterNavigationController, detailNavigationController]

		window.rootViewController = splitViewController
		window.makeKeyAndVisible()
	}
}

