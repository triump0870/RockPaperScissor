 //
//  ResultViewController.swift
//  RockPaperScissor
//
//  Created by Rohan Roy on 21/07/16.
//  Copyright © 2016 Rohan Roy. All rights reserved.
//

import UIKit

enum Shape: String {
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"
    
    static func randomShape() -> Shape{
        let shapes = ["Rock", "Paper", "Scissors"]
        let key = Int(arc4random_uniform(3))
        return Shape(rawValue: shapes[key])!
    }
}

class ResultViewController: UIViewController {
    
    var firstPlayer: Int?
    var secondPlayer: Int?
    
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultText: UILabel!
    
    var userChoice: Shape! = nil
    private let opponentChoice: Shape = Shape.randomShape()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        display()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func display() {
        var image: String
        var text: String
        
        let matchUp = "\(userChoice.rawValue) vs \(opponentChoice.rawValue)"
        
        switch(userChoice!, opponentChoice){
        case let (userChoice, opponentChoice) where userChoice == opponentChoice:
            image = "tie"
            text = "\(matchUp), It's a tie!"
            
        case (.Paper, .Rock),(.Rock,.Scissors),(.Scissors,.Paper):
            image = "\(userChoice.rawValue)-\(opponentChoice.rawValue)"
            text = "\(matchUp), You win!"
        default:
            image = "\(opponentChoice.rawValue)-\(userChoice.rawValue)"
            text = "\(matchUp), You lose! :("
        }
        
        image = image.lowercased()
        self.resultImage.image = UIImage(named: image)
        self.resultText.text = text
        
    
}


@IBAction func dismiss(_ sender: AnyObject) {
    self.dismiss(animated: true, completion: nil)
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */

}
