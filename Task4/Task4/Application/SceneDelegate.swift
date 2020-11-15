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

		let masterController = MasterViewController()
		let masterNavigationController = UINavigationController(rootViewController: masterController)
		
		let detailController = DetailViewController()
		let detailNavigationController = UINavigationController(rootViewController: detailController)

		masterController.detailNavigationController = detailNavigationController
		detailController.masterNavigationController = masterNavigationController
		
		let splitViewController =  MainSplitViewController()
		splitViewController.viewControllers = [masterNavigationController, detailNavigationController]

		
		window.rootViewController = splitViewController
		window.makeKeyAndVisible()
	}
}

