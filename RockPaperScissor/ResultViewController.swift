//
//  ResultViewController.swift
//  RockPaperScissor
//
//  Created by Rohan Roy on 21/07/16.
//  Copyright © 2016 Rohan Roy. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var firstPlayer: Int?
    var secondPlayer: Int?
    
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultText: UILabel!
    
    enum Planet:Int {
        case mercury=12, venus, earth, mars, jupiter, saturn, uranus, neptune
    }
    let ResultTextDict = ["12":"Paper cover Rock, You win!", "13":"Scissor cuts Paper, You lose!", "21":"Paper cover Rock, You lose!", "23":"Rock smashes Scissor, You win!", "31":"Scissor cuts Paper, You win!", "32":"Rock smashes Scissor, You lose!"
    ]
    
    let ResultImageDict = ["12":"d1", "13":"d3", "21":"d1", "23":"d2", "31":"d3", "32":"d2"]
    
    let PlayerList = [1:"Paper", 2:"Rock", 3:"Scissor"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let firstPlayer = self.firstPlayer, secondPlayer = self.secondPlayer {
            print("Firstplayer and secondplayer are: \(firstPlayer) and \(secondPlayer)")
////            print("FirstPlayer:\(firstPlayer%3)")
//            
            if firstPlayer == secondPlayer{
                self.resultImage.image = UIImage(named: "tie")
                self.resultText.text = "That's a human Tie"
            }
            else {
                let key = "\(firstPlayer)"+"\(secondPlayer)"
                self.resultImage.image = UIImage(named: ResultImageDict[key]!)
                self.resultText.text = ResultTextDict[key]
                
            }
            
       
        }
        self.resultImage.alpha = 0
        self.resultText.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3){
            self.resultImage.alpha = 1
            self.resultText.alpha = 1
        }
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
