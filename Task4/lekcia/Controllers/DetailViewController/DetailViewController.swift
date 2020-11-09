//
//  DetailViewController.swift
//  lekcia
//
//  Created by Admin on 06.11.2020.
//

import UIKit

class DetailViewController: UIViewController {
	//static let identifier = String(describing: DetailViewController.self)
	let roundedShadowImageView = RoundShadowImageView()
	var text: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
	  	configure()
		self.navigationItem.title = "Detail"
		self.navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
    }


	func configure() {
		self.view.addSubview(roundedShadowImageView)
		roundedShadowImageView.image = UIImage(named: ImagesNames.DogName.rawValue)
		NSLayoutConstraint.activate([roundedShadowImageView.trailingAnchor.constraint(
										equalTo: view.safeAreaLayoutGuide.trailingAnchor,
										constant: CGFloat(Constants.bottomAndTopSpace.rawValue)),
									 roundedShadowImageView.trailingAnchor.constraint(
										equalTo: view.safeAreaLayoutGuide.trailingAnchor,
										constant: CGFloat(Constants.bottomAndTopSpace.rawValue)),
									 roundedShadowImageView.trailingAnchor.constraint(
										equalTo: view.safeAreaLayoutGuide.trailingAnchor,
										constant: CGFloat(Constants.bottomAndTopSpace.rawValue)),
									 roundedShadowImageView.trailingAnchor.constraint(
										equalTo: view.safeAreaLayoutGuide.trailingAnchor,
									 constant: CGFloat(Constants.bottomAndTopSpace.rawValue))])
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
