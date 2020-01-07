//
//  ResultViewController.swift
//  Roshambo
//
//  Created by saturn9er on 24/08/2019.
//  Copyright © 2019 saturn9er. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var matchup: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var playersShape: Shape?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let playersShape = playersShape {
            let game = Game(shape: playersShape)
            let result = game.calculateResult()
            
            self.matchup.text = result.matchup
            self.label.text = result.text
            self.image.image = result.image
        }
    }
    
    @IBAction func playAgain(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
