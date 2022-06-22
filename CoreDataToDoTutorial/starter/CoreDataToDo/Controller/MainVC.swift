//
//  ViewController.swift
//  CoreDataToDo
//
//  Created by Kenta Kodashima on 2019-03-14.
//  Copyright © 2019 Kenta Kodashima. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
  
  // MARK: - Outlets
  @IBOutlet weak var todoTableView: UITableView!
  
  // MARK: - Properties

  // MARK: - View controller life-cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    todoTableView.delegate = self
    todoTableView.dataSource = self
  }


}

extension MainVC: UITableViewDelegate {
  
}

extension MainVC: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell", for: indexPath) as! ToDoTableViewCell
    
    cell.todoImage.image = UIImage(named: "no-image.png")
    cell.todoName.text = "ToDo Name"
    cell.todoDescription.text = "Description"
    
    return cell
  }
}
