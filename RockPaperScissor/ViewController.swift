//
//  ViewController.swift
//  RockPaperScissor
//
//  Created by Rohan Roy on 21/07/16.
//  Copyright © 2016 Rohan Roy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    func random() -> Int{
        let num = 1 + arc4random()%3
        return Int(num)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! ResultViewController
        controller.firstPlayer = sender?.tag
        print("sender tag:",sender?.tag)
        controller.secondPlayer = self.random()
        print("First player and second player in the view controller are \(controller.firstPlayer) and \(controller.secondPlayer)")
        
        
    }
    
}

