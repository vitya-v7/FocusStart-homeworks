//
//  ViewController1.swift
//  Task3
//
//  Created by user183410 on 11/1/20.
//

import UIKit

class ViewController1: UIViewController {

    // MARK: Life Cycle
    var myView: View1 = View1(frame: .zero)
    override func loadView() {
        self.view = myView
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        myView.makeButton2Rounded()
    }
}
