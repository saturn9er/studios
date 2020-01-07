//
//  Game.swift
//  Roshambo
//
//  Created by saturn9er on 24/08/2019.
//  Copyright © 2019 saturn9er. All rights reserved.
//

import Foundation
import UIKit

enum Shape: String, CaseIterable {
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"
    
    static func getRandomShape() -> Shape {
        let shapes = self.getShapesArray()
        let max = shapes.count - 1
        let randomChoice = Int.random(in: 0...max)
        
        return Shape(rawValue: shapes[randomChoice])!
    }
    
    static func getShapesArray() -> [String] {
        return Shape.allCases.map( { "\($0.rawValue)" } )
    }
}

struct Game {
    
    typealias GameResult = (matchup: String, text: String, image: UIImage)
    
    let playersShape: Shape
    let opponentsShape: Shape
    
    init(shape: Shape) {
        self.playersShape = shape
        self.opponentsShape = Shape.getRandomShape()
    }
    
    func calculateResult() -> GameResult{
        let text: String
        let image: UIImage
        let matchup = "\(playersShape.rawValue) vs. \(opponentsShape.rawValue)"
        
        switch (playersShape, opponentsShape) {
        case let (playersShape, opponentsShape) where playersShape == opponentsShape:
            text = "It's a tie"
            image = UIImage(named: "tie")!
        case (.scissors, .paper), (.paper, .rock), (.rock, .scissors):
            text = "You win🥳"
            image = UIImage(named: "\(playersShape)-\(opponentsShape)")!
        default:
            text = "You lose😞"
            image = UIImage(named: "\(opponentsShape)-\(playersShape)")!
        }
        
        return GameResult(matchup: matchup, text: text, image: image)
    }
    
}
