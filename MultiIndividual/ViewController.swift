//
//  ViewController.swift
//  MultiIndividual
//
//  Created by Anas AbuZaitoun on 09/06/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MultiIndividualTableViewCell", for: indexPath) as! MultiIndividualTableViewCell
        cell.setup(with: ["Anas", "ansas", "Asasa", "4", "5", "6", "5", "6"])
        return cell
    }
    
}

