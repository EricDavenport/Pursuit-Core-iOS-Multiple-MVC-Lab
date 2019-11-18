//
//  ViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Tom Seymour on 11/2/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var zooAnimals = [[ZooAnimal]]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        zooAnimals = ZooAnimal.getClassification()

        //animals = ZooAnimal
    }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    guard let animalDetailsVC = segue.destination as? AnimalDetailViewController,
               let indexPath = tableView.indexPathForSelectedRow else {
               return
           }
           
           // set animal on animalDetailsVC
            animalDetailsVC.animal = zooAnimals[indexPath.section][indexPath.row]
           
       }


}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return zooAnimals[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as? AnimalCellTableViewCell else {
            fatalError("Couldn't dequeue a animalCell")
        }
        let animal = zooAnimals[indexPath.section][indexPath.row]
       
        cell.configureCell(for: animal)
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return zooAnimals.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return zooAnimals[section].first?.classification
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 157
    }
}

