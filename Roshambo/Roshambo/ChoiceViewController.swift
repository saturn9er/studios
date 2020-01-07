//
//  ChoiceViewController.swift
//  Roshambo
//
//  Created by saturn9er on 24/08/2019.
//  Copyright © 2019 saturn9er. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func playForRock(_ sender: UIButton) {
        let vc: ResultViewController
        vc = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        vc.playersShape = getPlayersShape(sender)
        present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func playForPaper(_ sender: UIButton) {
        performSegue(withIdentifier: "play", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "play" {
            let vc = segue.destination as! ResultViewController
            vc.playersShape = getPlayersShape(sender as! UIButton)
        }
    }
    
    private func getPlayersShape(_ sender: UIButton) -> Shape {
        let shapes = Shape.getShapesArray()
        let tag = sender.tag
        return Shape(rawValue: shapes[tag])!
    }
    
    
}

