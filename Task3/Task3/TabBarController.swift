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
        let viewController1 = ViewController1()
        viewController1.tabBarItem = UITabBarItem(title: "First", image: nil, tag: 1)
        let viewController2 = ViewController2()
        viewController2.tabBarItem = UITabBarItem(title: "Second", image: nil, tag: 2)
        let viewController3 = ViewController3()
        viewController3.tabBarItem = UITabBarItem(title: "Third", image: nil, tag: 3)
        viewControllers = [viewController1, viewController2, viewController3]
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
