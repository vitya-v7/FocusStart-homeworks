//
//  DetailViewController.swift
//  lekcia
//
//  Created by Admin on 06.11.2020.
//

import UIKit

class DetailViewController: UIViewController {
	static let identifier = String(describing: DetailViewController.self)
	@IBOutlet var titleLabel: UILabel!
	@IBOutlet var imageView: UIImageView!
	@IBOutlet weak var shadowView: UIView!
	var text: String?

    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = UIColor.red
	//	configure(title: text ?? "")
		self.navigationItem.title = "Detail"
		self.navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
    }


	func configure(title: String) {
		titleLabel.text = title
		imageView.layer.cornerRadius = 20
		imageView.clipsToBounds = true
		shadowView.layer.shadowColor = UIColor.black.cgColor
		shadowView.layer.shadowRadius = 10
		shadowView.layer.shadowOffset = CGSize(width: 5, height: 5)
		shadowView.layer.shadowOpacity = 1
		shadowView.clipsToBounds = false
		//imageView.layer.shadowPath = UIBezierPath(rect: imageView.bounds).cgPath
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
