//
//  TabBarController.swift
//  Task3
//
//  Created by Admin on 03.11.2020.
//

import UIKit

class TabBarController: UITabBarController {
	override func viewDidLoad() {
		super.viewDidLoad()
		let firstViewController = FirstViewController()
		firstViewController.tabBarItem = UITabBarItem(title: "First", image: nil, tag: 1)
		let secondViewController = SecondViewController()
		secondViewController.tabBarItem = UITabBarItem(title: "Second", image: nil, tag: 2)
		let thirdViewController = ThirdViewController()
		thirdViewController.tabBarItem = UITabBarItem(title: "Third", image: nil, tag: 3)
		viewControllers = [firstViewController, secondViewController, thirdViewController]
	}
}
