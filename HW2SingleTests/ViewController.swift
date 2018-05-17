//
//  ViewController.swift
//  DelegationDemo
//
//  Created by Jonathan Engelsma on 2/10/17.
//  Copyright © 2017 Jonathan Engelsma. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ViceSelectionViewControllerDelegate {

    @IBOutlet weak var message: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func indicateSelection(vice: String) {
        self.message.text = "Your vice is: \(vice)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? ViceSelectionViewController {
            dest.delegate = self
        }
    }
}

