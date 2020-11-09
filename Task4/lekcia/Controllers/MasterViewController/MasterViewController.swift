//
//MasterViewController//  lekcia
//
//  Created by Admin on 06.11.2020.
//

import UIKit

class MasterViewController: UIViewController {
	//MARK: PROPERTIES
	let mockData = Mock.mockData()

	//MARK: VIEWS
	@IBOutlet weak var tableView: UITableView!

	//MARK: LIFE CYCLE
	override func viewDidLoad() {
		super.viewDidLoad()
		self.tableView.rowHeight = UITableView.automaticDimension
		//self.tableView.delegate = output
		//configureTapCell()
		// Do any additional setup after loading the view.
	}
}

	//MARK: DATA SOURCE
extension MasterViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return mockData.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let masterCell = tableView.dequeueReusableCell(withIdentifier: MasterTableViewCell.identifier, for: indexPath) as? MasterTableViewCell
		else { assertionFailure(); return UITableViewCell() }
		masterCell.configure(object: CellModel(title: "D",description: "DAS",date: "FDS"))
		return masterCell
	}
}

//MARK: Delegate
extension MasterViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let description = self.mockData[indexPath.row].description
		let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
		guard let detailViewController = mainStoryboard.instantiateViewController(identifier: DetailViewController.identifier) as? DetailViewController else { return }
		detailViewController.text = description
		self.splitViewController?.showDetailViewController(detailViewController, sender: self) 
		//self.navigationController?.pushViewController(detailViewController, animated: true)
	}
}

