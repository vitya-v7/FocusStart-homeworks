//
//  AddListViewController.swift
//  Task8
//
//  Created by Admin on 17.12.2020.
//

import UIKit

protocol AddListViewControllerDelegate {
	func addList(name: String )
}

class AddListViewController: UIViewController {

	weak var delegate: AddListViewControllerDelegate
	let nameTextField: UITextField //OUTLET(можно работать со сторибордом)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
	func save() {
		guard let name = nameField.text else {
			return
		}

		delegate.addList(name: name)
		navigationController?.popViewController(animated: true)
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
