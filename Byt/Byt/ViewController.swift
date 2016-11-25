//
//  ViewController.swift
//  Byt
//
//  Created by Amber Spadafora on 11/22/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var octoButton: UIImageView!
    @IBAction func octoTapped(_ sender: UITapGestureRecognizer) {
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tappedMe))
        octoButton.addGestureRecognizer(tap)
        octoButton.isUserInteractionEnabled = true
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tappedMe(){
        performSegue(withIdentifier: "goToOperationsTable", sender: self)
    }




}

