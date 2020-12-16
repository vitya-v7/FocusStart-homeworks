//
//  ViewController.swift
//  Task8
//
//  Created by Admin on 16.12.2020.
//

import UIKit
import CoreData

class ViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!

	let appDelegate = UIApplication.shared.delegate as! AppDelegate
	var context: NSManagedObjectContext!
	var container: NSPersistentContainter!

	var lists = [List]() {
		didSet {
			self.tableView.reloadData()
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		container = self.appDelegate.persistentContainer
		self.context = self.container.viewContext
		self.fetchData()
	}

	func fetchData() {
		let request: NSFetchRequest<List> = List.fetchRequest()
		do {
			lists = try context.fetch(request)
		}
		catch {
			print(error)
		}
	}
}

extension ViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.lists.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
		let list = lists[indexPath.row]
		cell.textLabel?.text = list.name
		return cell
	}
}

extension ViewController: UITableViewDelegate {

}

extension ViewController: AddListViewControllerDelegate {
	func addList(name:String) {
		let list = List(context:  self.context)
		list.name = name //здесь уже происходит добавление в б/д, на след строке просто сохраняем контекст
		appDelegate.saveContext()
		fetchData()
	}
}
