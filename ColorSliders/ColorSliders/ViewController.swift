//
//  ViewController.swift
//  ColorSliders
//
//  Created by saturn9er on 24/08/2019.
//  Copyright © 2019 saturn9er. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    // MARK: Lifecycle callbacks
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialColorProfile(red: 0.95, green: 0.65, blue: 0.1)
    }
    
    // Sets background color of main view and values of labels with the given color settings
    private func setColorProfile(red: Float, green: Float, blue: Float, _ alpha:Float = 1.0) {
        let r = CGFloat(red)
        let g = CGFloat(green)
        let b = CGFloat(blue)
        let a = CGFloat(alpha)
        view.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: a)
        
        setValuesOfLabels(red: red, green: green, blue: blue)
    }
    
    // Sets values of sliders and color profile with the given color settings
    private func setInitialColorProfile(red: Float, green: Float, blue: Float) {
        self.redSlider.setValue(red, animated: true)
        self.greenSlider.setValue(green, animated: true)
        self.blueSlider.setValue(blue, animated: true)
        setColorProfile(red: red, green: green, blue: blue)
    }
    
    private func setValuesOfLabels(red: Float, green: Float, blue: Float) {
        self.redLabel.text = String(format: "%.0f", red * 255)
        self.greenLabel.text = String(format: "%.0f", green * 255)
        self.blueLabel.text = String(format: "%.0f", blue * 255)
    }
    
    // MARK: Actions
    @IBAction func updateColorProfile(_ sender: UISlider) {
        let r = self.redSlider.value
        let g = self.greenSlider.value
        let b = self.blueSlider.value
        
        setColorProfile(red: r, green: g, blue: b)
    }
    
}
