//
//  AnimalDetailViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Eric Davenport on 11/18/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class AnimalDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var originClass: UILabel!
    
    var animal: ZooAnimal?
    
    func updateUI() {
        guard let thisAnimal = animal else {
            fatalError("Couldn't obtain the animal value, verify the perpare(for segue: )")
        }
        title = animal?.name
        imageView.image = UIImage(named: "\(thisAnimal.imageNumber)")
        detailsLabel.text = thisAnimal.info
        originClass.text = "Origin: \(thisAnimal.origin)\nClassification: \(thisAnimal.origin)"
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        // Do any additional setup after loading the view.
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
