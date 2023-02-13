//
//  ViewController.swift
//  CustomCircleProgressBar
//
//  Created by jongmin.lee on 2023/02/13.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(CircleProgressCell.self, forCellReuseIdentifier: String(describing: CircleProgressCell.self))
    tableView.rowHeight = UITableView.automaticDimension
  }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CircleProgressCell.self), for: indexPath) as! CircleProgressCell
    cell.setProgress(progress: (indexPath.row * 10))
    
    return cell
  }
}
