//
//  ViewController3.swift
//  Task3
//
//  Created by Admin on 03.11.2020.
//

import UIKit

class ViewController3: UIViewController {

    // MARK: Life Cycle
    
    var myView: View3 = View3(frame: .zero)
    
    override func loadView() {
        myView.tabBarHeight = self.tabBarController?.tabBar.frame.height
        self.view = myView
    }


}
