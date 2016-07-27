//
//  ViewController.swift
//  RockPaperScissor
//
//  Created by Rohan Roy on 21/07/16.
//  Copyright © 2016 Rohan Roy. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {

    private var selectedButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func rockButton(_ sender: UIButton) {
        selectedButton = sender
        self.performSegue(withIdentifier: "play", sender: sender)
    }
    
    @IBAction func paperButton(_ sender: UIButton) {
        selectedButton = sender
        self.performSegue(withIdentifier: "play", sender: sender)
    }
    
    @IBAction func scissorButton(_ sender: UIButton) {
        selectedButton = sender
        self.performSegue(withIdentifier: "play", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! ResultViewController
        controller.userChoice = getUserShape(sender: selectedButton)
    }
    
    func getUserShape(sender: UIButton) -> Shape{
        let shape = sender.title(for: .normal)!
        return Shape(rawValue: shape)!
    }
    
}

