//
//  AnimalCellTableViewCell.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Eric Davenport on 11/18/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class AnimalCellTableViewCell: UITableViewCell {

    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var animalNameLabel: UILabel!
    @IBOutlet weak var animalOriginLabel: UILabel!
    

    func configureCell(for zooAnimal: ZooAnimal) {
        animalNameLabel.text = zooAnimal.name
        animalOriginLabel.text = zooAnimal.origin
        animalImage.image = UIImage(named: "\(zooAnimal.imageNumber)")
    }
    
}
